import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';
import 'package:poker_app/features/home/presentation/widgets/pokemon_detail_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  testWidgets('PokemonDetailWidget exibe detalhes corretamente',
      (tester) async {
    // Arrange
    final pokemon = Pokemon(
      id: 1,
      name: 'bulbasaur',
      height: 7,
      weight: 69,
      baseExperience: 64,
      order: 1,
      abilities: [
        Ability(ability: Species(name: 'overgrow')),
        Ability(ability: Species(name: 'chlorophyll')),
      ],
      types: [
        Type(type: Species(name: 'grass')),
        Type(type: Species(name: 'poison')),
      ],
      sprites: Sprites(
        other: Other(
          officialArtwork: OfficialArtwork(
              frontDefault: 'https://image-url.com/bulbasaur.png'),
        ),
      ),
    );

    bool backPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PokemonDetailWidget(
            pokemon: pokemon,
            onBack: () => backPressed = true,
          ),
        ),
      ),
    );

    // Assert - nome capitalizado
    expect(find.text('Bulbasaur'), findsOneWidget);

    // Assert - imagem via CachedNetworkImage
    expect(find.byType(CachedNetworkImage), findsOneWidget);

    // Assert - valores textuais
    expect(find.text('ID: '), findsOneWidget);
    expect(find.text('1'), findsWidgets);

    expect(find.text('Classificação: '), findsOneWidget);
    expect(find.text('Altura: '), findsOneWidget);
    expect(find.text('Peso:'), findsOneWidget);
    expect(find.text('XP: '), findsOneWidget);

    // Assert - habilidades traduzidas
    expect(find.textContaining('Crescimento excessivo'), findsOneWidget);
    expect(find.textContaining('Clorofila'), findsOneWidget);

    // Assert - tipos como chips traduzidos
    expect(find.widgetWithText(Chip, 'Planta'), findsOneWidget);
    expect(find.widgetWithText(Chip, 'Venenoso'), findsOneWidget);
  });
}
