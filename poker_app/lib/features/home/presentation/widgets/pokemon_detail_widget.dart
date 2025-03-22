import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

class PokemonDetailWidget extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onBack;

  const PokemonDetailWidget({
    super.key,
    required this.pokemon,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        pokemon.sprites?.other?.officialArtwork?.frontDefault ??
            'https://via.placeholder.com/150';

    return SingleChildScrollView(
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBack,
          ),
          Hero(
            tag: 'pokemon-image-${pokemon.id}',
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            pokemon.name![0].toUpperCase() + pokemon.name!.substring(1),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('ID: ${pokemon.id}'),
          Text('Altura: ${pokemon.height}'),
          Text('Peso: ${pokemon.weight}'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: pokemon.types!
                .map((t) => Chip(label: Text(t.type?.name ?? '')))
                .toList(),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
