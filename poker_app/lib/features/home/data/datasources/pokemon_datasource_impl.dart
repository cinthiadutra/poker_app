// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:poker_app/core/network/pokeapi_endpoint.dart';
import 'package:poker_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

class PokemonDatasourceImpl extends PokemonDatasource {
  final Dio _dio;
  PokemonDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<PokemonListResponse> fetchPokemonList({String? url}) async {
    final response = await _dio.get(url ?? '/pokemon?limit=20&offset=0');
    return PokemonListResponse.fromMap(response.data);
  }

  @override
  Future<Pokemon> getPokemonById(int id) async {
    final response = await _dio.get('${PokeApiEndpoints.pokemon}$id/');
    return Pokemon.fromMap(response.data as Map<String, dynamic>);
  }
}
