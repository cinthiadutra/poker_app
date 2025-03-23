import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository_impl.dart';

class MockPokemonDatasource extends Mock implements PokemonDatasource {}

void main() {
  late PokemonRepositoryImpl repository;
  late MockPokemonDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockPokemonDatasource();
    repository = PokemonRepositoryImpl(datasource: mockDatasource);
  });

  group('PokemonRepositoryImpl', () {
    test('should return PokemonListResponse when fetchPokemonList is called',
        () async {
      final mockResponse = PokemonListResponse(
          count: 1,
          next: null,
          previous: null,
          results: [
            PokemonListItem(
                name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/')
          ]);

      when(() => mockDatasource.fetchPokemonList())
          .thenAnswer((_) async => mockResponse);

      final result = await repository.fetchPokemonList();

      expect(result, isA<PokemonListResponse>());
      expect(result.results.first.name, equals('bulbasaur'));
      verify(() => mockDatasource.fetchPokemonList()).called(1);
    });

    test('should return Pokemon when getPokemonById is called', () async {
      final mockPokemon = Pokemon(id: 1, name: 'bulbasaur');

      when(() => mockDatasource.getPokemonById(1))
          .thenAnswer((_) async => mockPokemon);

      final result = await repository.getPokemonById(1);

      expect(result, isA<Pokemon>());
      expect(result.name, equals('bulbasaur'));
      verify(() => mockDatasource.getPokemonById(1)).called(1);
    });
  });
}
