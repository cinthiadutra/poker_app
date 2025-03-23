import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/core/contants.dart';
import 'package:poker_app/core/utils/app_colors.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';
import 'package:poker_app/features/home/presentation/widgets/pokemon_list_widget.dart';

class HomePage extends StatefulWidget {
    final HomeCubit cubit;

  const HomePage({super.key, required this.cubit});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  String searchTerm = '';
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 367) {
      // Quando estiver perto do fim, chama o próximo carregamento
      widget.cubit.fetchPokemonList();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);

    if (!(widget.cubit.state is PokemonListLoaded ||
        widget.cubit.state is PokemonListLoadingMore)) {
      widget.cubit.fetchPokemonList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'PokeApp',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.secundary,
      ),
      body: Container(
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(bg))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Buscar Pokémon por nome',
                  fillColor: AppColors.secundary,
                  focusColor: AppColors.secundary,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.secundary),
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                onChanged: (value) {
                  setState(() {
                    searchTerm = value.toLowerCase();
                  });
                },
              ),
            ),
            Expanded(
              child: BlocConsumer<HomeCubit, HomeState>(
                bloc: widget.cubit,
                listener: (context, state) {
                  if (state is HomeError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeError) {
                    return const Center(
                      child: Text(
                        'Erro ao carregar dados.',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state is PokemonListLoaded ||
                      state is PokemonListLoadingMore) {
                    final pokemons = state is PokemonListLoaded
                        ? state.pokemons
                        : (state as PokemonListLoadingMore).pokemons;

                    final filtered = pokemons.results
                        .where((p) => p.name.toLowerCase().contains(searchTerm))
                        .toList();

                    return PokemonListWidget(
                      pokemons: pokemons.copyWith(results: filtered),
                      onItemTap: (item) {
                        Modular.to.pushNamed('/home/detail', arguments: item);
                      },
                    );
                  } else {
                    return const Center(child: Text('Nenhum dado.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
