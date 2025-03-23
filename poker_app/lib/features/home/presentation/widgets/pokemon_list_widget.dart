import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/core/utils/app_colors.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:shimmer/shimmer.dart';

class PokemonListWidget extends StatefulWidget {
  final PokemonListResponse pokemons;
  final void Function(dynamic item) onItemTap;
  final VoidCallback? onEndReached; // <- callback para paginação

  const PokemonListWidget({
    super.key,
    required this.pokemons,
    required this.onItemTap,
    this.onEndReached,
  });

  @override
  State<PokemonListWidget> createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  String _orderBy = 'id';
  final ScrollController _scrollController = ScrollController();
  final cubit = Modular.get<HomeCubit>();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
        .removeListener(_onScroll); // <-- REMOVE PARA EVITAR MEMORY LEAK
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      // Quando estiver perto do fim, chama o próximo carregamento
      cubit.fetchPokemonList();
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sortedList = [...widget.pokemons.results];

    if (_orderBy == 'name') {
      sortedList.sort((a, b) => a.name.compareTo(b.name));
    } else {
      sortedList.sort((a, b) {
        final aId = int.tryParse(a.url.split('/').reversed.elementAt(1)) ?? 0;
        final bId = int.tryParse(b.url.split('/').reversed.elementAt(1)) ?? 0;
        return aId.compareTo(bId);
      });
    }

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  const Text('Ordenar por:'),
                  const SizedBox(width: 12),
                  DropdownButton<String>(
                    value: _orderBy,
                    items: const [
                      DropdownMenuItem(value: 'id', child: Text('ID')),
                      DropdownMenuItem(value: 'name', child: Text('Nome')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _orderBy = value;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                controller: _scrollController,
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                childAspectRatio: 0.9,
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: sortedList.map((pokemon) {
                  final id = int.tryParse(
                        pokemon.url
                            .split('/')[pokemon.url.split('/').length - 2],
                      ) ??
                      0;

                  final imageUrl =
                      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

                  return InkWell(
                    onTap: () => widget.onItemTap(id),
                    child: Card(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: 'pokemon-image-$id',
                              child: CachedNetworkImage(
                                imageUrl: imageUrl,
                                height: 150,
                                scale: 0.5,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: const CircleAvatar(radius: 36),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              pokemon.name[0].toUpperCase() +
                                  pokemon.name.substring(1),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          right: 16,
          child: FloatingActionButton(
            shape: CircleBorder(),
            onPressed: _scrollToTop,
            backgroundColor: AppColors.secundary,
            mini: true,
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
