import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final PokemonRepository repository;

  String? _nextUrl = '/pokemon?limit=20&offset=0';
  final List<PokemonListItem> _allResults = [];

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> fetchPokemonList() async {
    // Se _nextUrl for nulo e já estivermos carregando, não faz nada
    if (state is HomeLoading || state is PokemonListLoadingMore) return;

    final bool isFirstLoad = _allResults.isEmpty;
    final String fetchUrl = _nextUrl ?? '/pokemon?limit=20&offset=0';

    try {
      if (isFirstLoad) {
        emit(HomeLoading());
      } else {
        emit(PokemonListLoadingMore(
          pokemons: PokemonListResponse(
            count: _allResults.length,
            next: _nextUrl,
            previous: null,
            results: [..._allResults],
          ),
        ));
      }

      final result = await repository.fetchPokemonList(url: fetchUrl);

      _allResults.addAll(result.results);
      _nextUrl = result.next;

      emit(PokemonListLoaded(
        pokemons: PokemonListResponse(
          count: result.count,
          next: result.next,
          previous: result.previous,
          results: [..._allResults],
        ),
      ));
    } catch (e) {
      emit(HomeError('Erro ao carregar pokémons.'));
    }
  }

  Future<void> fetchPokemonDetail(int id) async {
    emit(HomeLoading());
    try {
      final detail =
          await repository.getPokemonById(id); // supondo que já existe
      emit(PokemonDetailLoaded(pokemon: detail));
    } catch (e) {
      emit(HomeError('Erro ao carregar detalhes do pokémon.'));
    }
  }
}
