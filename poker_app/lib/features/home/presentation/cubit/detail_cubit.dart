// lib/features/home/presentation/cubit/detail_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';

class DetailCubit extends Cubit<HomeState> {
  final PokemonRepository repository;

  DetailCubit({required this.repository}) : super(HomeInitial());

  Future<void> fetchPokemonDetail(int id) async {
    emit(HomeLoading());
    try {
      final detail = await repository.getPokemonById(id);
      emit(PokemonDetailLoaded(pokemon: detail));
    } catch (e) {
      emit(HomeError('Erro ao carregar detalhes do pokémon.'));
    }
  }
}
