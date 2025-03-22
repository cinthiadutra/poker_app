import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final repository = Modular.get<PokemonRepository>();

  HomeCubit() : super(HomeInitial());

  Future<void> fetchPokemonList() async {
    emit(HomeLoading());
    try {
      final pokemons = await repository.fetchPokemonList();
      emit(PokemonListLoaded(pokemons));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> fetchPokemonDetail(int id) async {
    emit(HomeLoading());
    try {
      final pokemon = await repository.getPokemonById(id);
      emit(PokemonDetailLoaded(pokemon));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
