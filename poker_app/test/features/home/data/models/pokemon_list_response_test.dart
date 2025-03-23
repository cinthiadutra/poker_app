import 'package:flutter_test/flutter_test.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';

void main() {
  group('PokemonListResponse', () {
    test('fromMap e toMap devem funcionar corretamente', () {
      final map = {
        "count": 1,
        "next": "next_url",
        "previous": null,
        "results": [
          {"name": "pikachu", "url": "https://pokeapi.co/api/v2/pokemon/25/"}
        ]
      };

      final response = PokemonListResponse.fromMap(map);
      expect(response.count, 1);
      expect(response.next, "next_url");
      expect(response.results.first.name, "pikachu");

      final toMap = response.copyWith().toMap();
      expect(toMap["count"], 1);
    });

    test('copyWith deve manter os valores atuais se nenhum for passado', () {
      final original = PokemonListResponse(
        count: 1,
        next: "next",
        previous: "prev",
        results: [PokemonListItem(name: "bulbasaur", url: "url")],
      );

      final copy = original.copyWith();
      expect(copy.count, original.count);
      expect(copy.results.length, 1);
    });
  });
}
