import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:poker_app/core/utils/app_colors.dart';
import 'package:poker_app/core/utils/enums.dart';
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
    final imageUrl = pokemon.sprites?.other?.officialArtwork?.frontDefault ??
        'https://via.placeholder.com/150';

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Hero(
          tag: 'pokemon-image-${pokemon.id}',
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          pokemon.name![0].toUpperCase() + pokemon.name!.substring(1),
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.secundary),
        ),
        Divider(
          color: AppColors.secundary,
          height: 3,
        ),
        const SizedBox(height: 20),
        Container(
          color: AppColors.secundary,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('ID: ',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text('${pokemon.id}',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                  ],
                ),
                Row(
                  children: [
                    Text('Classificação: ',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text('${pokemon.order}',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                  ],
                ),
                Row(
                  children: [
                    Text('Altura: ',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text('${pokemon.height} dcm',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                  ],
                ),
                Row(
                  children: [
                    Text('Peso:',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text('${pokemon.weight}hg',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                  ],
                ),
                Row(
                  children: [
                    Text('XP: ',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Text('${pokemon.baseExperience}',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                  ],
                ),
                Row(
                  children: [
                    Text('Habilidades: ',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    Expanded(
                      child: Text(
                        pokemon.abilities!
                            .map((a) =>
                                PokemonAbility.translate(a.ability?.name ?? ''))
                            .join(', '),
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                  child: Wrap(
                    spacing: 8,
                    children: pokemon.types!.map(
                      (t) {
                        final typeName = t.type?.name ?? '';
                        final translated =
                            PokemonTypeExtension.fromName(typeName)
                                .translatedName;

                        return Chip(
                          label: Text(
                            translated,
                            style: TextStyle(
                              color: AppColors.secundary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: AppColors.white,
                        );
                      },
                    ).toList(),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}
