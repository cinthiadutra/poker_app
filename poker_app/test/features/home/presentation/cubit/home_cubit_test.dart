import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late MockPokemonRepository repository;
  late HomeCubit cubit;

  setUp(() {
    repository = MockPokemonRepository();
    cubit = HomeCubit();
  });

  final pokemonListResponse = PokemonListResponse(
    count: 1,
    results: [
      PokemonListItem(name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/')
    ],
  );

  final pokemon = Pokemon(id: 1, name: 'bulbasaur');

  group('HomeCubit', () {
    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, PokemonListLoaded] when fetchPokemonList is successful',
      build: () {
        when(() => repository.fetchPokemonList()).thenAnswer((_) async => pokemonListResponse);
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonList(),
      expect: () => [HomeLoading(), PokemonListLoaded(pokemonListResponse)],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, HomeError] when fetchPokemonList throws exception',
      build: () {
        when(() => repository.fetchPokemonList()).thenThrow(Exception('Failed'));
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonList(),
      expect: () => [HomeLoading(), isA<HomeError>()],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, PokemonDetailLoaded] when fetchPokemonDetail is successful',
      build: () {
        when(() => repository.getPokemonById(3)).thenAnswer((_) async => pokemon);
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonDetail(1),
      expect: () => [HomeLoading(), PokemonDetailLoaded(pokemon)],
    );

blocTest<HomeCubit, HomeState>(
  'emits [HomeLoading, HomeError] when fetchPokemonDetail throws exception',
  build: () {
    when(() => repository.getPokemonById(5)).thenThrow(Exception('Erro ao buscar detalhes'));
    return cubit;
  },
  act: (cubit) => cubit.fetchPokemonDetail(5),
  expect: () => [
    HomeLoading(),
    isA<HomeError>(),
  ],
);

  });}
