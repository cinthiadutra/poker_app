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
    cubit = HomeCubit(repository);
  });

  group('HomeCubit', () {
    final mockResponsePage1 = PokemonListResponse(
      count: 40,
      next: '/pokemon?limit=20&offset=20',
      previous: null,
      results: List.generate(
        20,
        (i) => PokemonListItem(name: 'poke$i', url: 'url/$i'),
      ),
    );

    final mockResponsePage2 = PokemonListResponse(
      count: 40,
      next: null,
      previous: '/pokemon?limit=20&offset=0',
      results: List.generate(
        20,
        (i) => PokemonListItem(name: 'poke${i + 20}', url: 'url/${i + 20}'),
      ),
    );

    final mockPokemon = Pokemon(name: 'Pikachu');

    test('initial state is HomeInitial', () {
      expect(cubit.state, equals(HomeInitial()));
    });

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, PokemonListLoaded] on first page load',
      build: () {
        when(() => repository.fetchPokemonList(url: any(named: 'url')))
            .thenAnswer((_) async => mockResponsePage1);
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonList(),
      expect: () => [
        isA<HomeLoading>(),
        isA<PokemonListLoaded>()
            .having((s) => s.pokemons.results.length, 'length', 20),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, PokemonListLoaded, PokemonListLoadingMore, PokemonListLoaded] when loading next page',
      build: () {
        when(() => repository.fetchPokemonList(url: any(named: 'url')))
            .thenAnswer((invocation) async {
          final url = invocation.namedArguments[#url] as String?;

          if (url == null || url == '/pokemon?limit=20&offset=0') {
            return mockResponsePage1;
          } else if (url ==
              'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20') {
            return mockResponsePage2;
          }

          return mockResponsePage1; // fallback
        });

        return cubit;
      },
      act: (cubit) async {
        cubit.fetchPokemonList(); // first page
        cubit.fetchPokemonList(); // second page
      },
      expect: () => [
        isA<HomeLoading>(),
        isA<PokemonListLoaded>()
            .having((s) => s.pokemons.results.length, 'length', 20),
        isA<PokemonListLoadingMore>(),
        isA<PokemonListLoaded>()
            .having((s) => s.pokemons.results.length, 'length', 40),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeError on fetchPokemonList exception',
      build: () {
        when(() => repository.fetchPokemonList(url: any(named: 'url')))
            .thenThrow(Exception('Erro'));
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonList(),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeError>()
            .having((s) => s.message, 'message', contains('Erro ao carregar')),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [HomeLoading, PokemonDetailLoaded] on fetchPokemonDetail success',
      build: () {
        when(() => repository.getPokemonById(1))
            .thenAnswer((_) async => mockPokemon);
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonDetail(1),
      expect: () => [
        isA<HomeLoading>(),
        isA<PokemonDetailLoaded>()
            .having((s) => s.pokemon.name, 'name', 'Pikachu'),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits HomeError on fetchPokemonDetail exception',
      build: () {
        when(() => repository.getPokemonById(1)).thenThrow(Exception('Erro'));
        return cubit;
      },
      act: (cubit) => cubit.fetchPokemonDetail(1),
      expect: () => [
        isA<HomeLoading>(),
        isA<HomeError>()
            .having((s) => s.message, 'message', contains('Erro ao carregar')),
      ],
    );
  });
}
