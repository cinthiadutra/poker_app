// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:poker_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

class PokemonDatasourceImpl extends PokemonDatasource {
    final Dio dio;
  PokemonDatasourceImpl({
    required this.dio,
  });
  @override
  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon?limit=20');
    final List results = response.data['results'];
    return Future.wait(
      results.map((e) async {
        final detailResponse = await dio.get(e['url']);
        return Pokemon.fromMap(detailResponse.data);
      }),
    );
  }
}
 

