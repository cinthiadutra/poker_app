import 'package:equatable/equatable.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import '../../data/models/pokemon_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

class PokemonListLoaded extends HomeState {
  final PokemonListResponse pokemons;

  const PokemonListLoaded({required this.pokemons});

  @override
  List<Object?> get props => [pokemons];
}

class PokemonDetailLoaded extends HomeState {
  final Pokemon pokemon;

  const PokemonDetailLoaded({required this.pokemon});

  @override
  List<Object?> get props => [pokemon];
}

class PokemonListLoadingMore extends HomeState {
  final PokemonListResponse pokemons;

  const PokemonListLoadingMore({required this.pokemons});
}
