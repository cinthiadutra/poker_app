// test/features/home/presentation/cubit/detail_cubit_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/presentation/cubit/detail_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late MockPokemonRepository repository;
  late DetailCubit cubit;

  setUp(() {
    repository = MockPokemonRepository();
    cubit = DetailCubit(repository: repository);
  });

  tearDown(() {
    cubit.close();
  });

  final mockPokemon = Pokemon(id: 1, name: 'bulbasaur');

  group('DetailCubit', () {
    blocTest<DetailCubit, HomeState>(
      'emits [HomeLoading, PokemonDetailLoaded] when fetchPokemonDetail succeeds',
      build: () {
        when(() => repository.getPokemonById(1))
            .thenAnswer((_) async => mockPokemon);
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonDetail(1),
      expect: () => [
        isA<HomeLoading>(),
        isA<PokemonDetailLoaded>()
            .having((s) => s.pokemon.name, 'pokemon.name', 'bulbasaur'),
      ],
    );

    blocTest<DetailCubit, HomeState>(
      'emits [HomeLoading, HomeError] when fetchPokemonDetail throws',
      build: () {
        when(() => repository.getPokemonById(1)).thenThrow(Exception('Erro'));
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonDetail(1),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeError>().having((e) => e.message, 'message',
            'Erro ao carregar detalhes do pokémon.'),
      ],
    );
  });
}
