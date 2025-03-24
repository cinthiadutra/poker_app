import 'package:flutter_test/flutter_test.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

void main() {
  group('Pokemon Model', () {
    test('fromMap deve parsear corretamente todos os campos', () {
      final map = {
        "id": 25,
        "name": "pikachu",
        "base_experience": 112,
        "height": 4,
        "weight": 60,
        "order": 35,
        "abilities": [
          {
            "is_hidden": false,
            "slot": 1,
            "ability": {"name": "static", "url": "https://pokeapi.co/api/v2/ability/9/"}
          },
          {
            "is_hidden": true,
            "slot": 3,
            "ability": {"name": "lightning-rod", "url": "https://pokeapi.co/api/v2/ability/31/"}
          }
        ],
        "types": [
          {
            "slot": 1,
            "type": {"name": "electric", "url": "https://pokeapi.co/api/v2/type/13/"}
          }
        ],
        "stats": [
          {
            "base_stat": 35,
            "effort": 0,
            "stat": {"name": "hp", "url": "https://pokeapi.co/api/v2/stat/1/"}
          }
        ],
        "sprites": {
          "other": {
            "official-artwork": {
              "front_default": "https://example.com/sprite.png"
            }
          }
        }
      };

      final pokemon = Pokemon.fromMap(map);

      expect(pokemon.id, 25);
      expect(pokemon.name, "pikachu");
      expect(pokemon.baseExperience, 112);
      expect(pokemon.height, 4);
      expect(pokemon.weight, 60);
      expect(pokemon.order, 35);

      // Abilities
      expect(pokemon.abilities?.length, 2);
      expect(pokemon.abilities?[0].ability?.name, 'static');
      expect(pokemon.abilities?[1].isHidden, true);

      // Types
      expect(pokemon.types?.first.type?.name, 'electric');

      // Stats
      expect(pokemon.stats?.first.stat?.name, 'hp');
      expect(pokemon.stats?.first.baseStat, 35);

      // Sprites
      final imageUrl = pokemon.sprites?.other?.officialArtwork?.frontDefault;
      expect(imageUrl, "https://example.com/sprite.png");
    });
  });
}
