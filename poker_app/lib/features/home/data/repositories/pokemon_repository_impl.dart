// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:poker_app/features/home/data/datasources/pokemon_datasource.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDatasource datasource;
  PokemonRepositoryImpl({
    required this.datasource,
  });
 @override
  Future<PokemonListResponse> fetchPokemonList({String? url}) {
    return datasource.fetchPokemonList(url: url);
  }

  @override
  Future<Pokemon> getPokemonById(int id) async {
    return await datasource.getPokemonById(id);
  }
}
