import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:shimmer/shimmer.dart';

class PokemonListWidget extends StatelessWidget {
  final PokemonListResponse pokemons;
  final void Function(dynamic item) onItemTap;

  const PokemonListWidget({
    super.key,
    required this.pokemons,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemons.results.length,
      itemBuilder: (context, index) {
        final pokemon = pokemons.results[index];
        final id = int.tryParse(
              pokemon.url.split('/')[pokemon.url.split('/').length - 2],
            ) ??
            0;
        final imageUrl =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

        return Card(
          child: ListTile(
            leading: Hero(
              tag: 'pokemon-image-$id',
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: const CircleAvatar(radius: 24),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            title: Text(
              pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => onItemTap(id),
          ),
        );
      },
    );
  }
}
