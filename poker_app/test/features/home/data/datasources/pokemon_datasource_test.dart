import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/core/network/dio_client.dart';
import 'package:poker_app/features/home/data/datasources/pokemon_datasource_impl.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

class MockDio extends Mock implements DioClient {}

void main() {
  late MockDio mockDio;
  late PokemonDatasourceImpl datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = PokemonDatasourceImpl();
  });

  test('should return PokemonListResponse when fetchPokemonList is called', () async {
    final json = {
      "count": 1,
      "results": [
        {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"}
      ]
    };

    when(() => mockDio.client.get(any())).thenAnswer(
      (_) async => Response(
        data: json,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await datasource.fetchPokemonList();

    expect(result, isA<PokemonListResponse>());
    expect(result.results.first.name, 'bulbasaur');
  });

  test('should return Pokemon when getPokemonById is called', () async {
    final json = {
      "id": 1,
      "name": "bulbasaur",
      "height": 7,
      "weight": 69,
      "types": [],
      "sprites": {},
    };

    when(() => mockDio.client.get(any())).thenAnswer(
      (_) async => Response(
        data: json,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await datasource.getPokemonById(1);

    expect(result, isA<Pokemon>());
    expect(result.id, 1);
    expect(result.name, 'bulbasaur');
  });
}
