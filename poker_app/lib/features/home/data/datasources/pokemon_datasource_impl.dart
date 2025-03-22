// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/core/network/dio_client.dart';
import 'package:poker_app/core/network/pokeapi_endpoint.dart';

import 'package:poker_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

class PokemonDatasourceImpl extends PokemonDatasource {
 final Dio _dio = Modular.get<DioClient>().client;

  @override

  Future<PokemonListResponse> fetchPokemonList({int offset = 0, int limit = 20}) async {
  final response = await _dio.get('${PokeApiEndpoints.pokemon}?offset=$offset&limit=$limit');
  return PokemonListResponse.fromMap(response.data);
}
@override
  Future<Pokemon> getPokemonById(int id) async {
    final response = await _dio.get('${PokeApiEndpoints.pokemon}$id}');
    return Pokemon.fromMap(response.data);
  }
}
 

