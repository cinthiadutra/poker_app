import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';

abstract class PokemonRepository {
Future<PokemonListResponse> fetchPokemonList({String? url});
Future<Pokemon> getPokemonById(int id);
}