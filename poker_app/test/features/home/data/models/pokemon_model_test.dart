import 'package:flutter_test/flutter_test.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

void main() {
  group('Pokemon Model', () {
    test('fromMap deve parsear corretamente', () {
      final map = {
        "id": 25,
        "name": "pikachu",
        "height": 4,
        "weight": 60,
        "abilities": [
          {
            "is_hidden": false,
            "slot": 1,
            "ability": {"name": "static", "url": "https://pokeapi.co/api/v2/ability/9/"}
          }
        ],
        "stats": [],
        "types": [],
        "sprites": null
      };

      final pokemon = Pokemon.fromMap(map);
      expect(pokemon.id, 25);
      expect(pokemon.name, "pikachu");
      expect(pokemon.height, 4);
      expect(pokemon.abilities?.first.ability?.name, "static");
    });
  });
}
