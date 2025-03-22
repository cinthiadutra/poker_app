import 'package:poker_app/features/home/data/models/pokemon_model.dart';

abstract class PokemonDatasource {

  Future<List<Pokemon>> fetchPokemonList();
}