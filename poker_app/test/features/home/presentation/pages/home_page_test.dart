import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/module/home_module.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';
import 'package:poker_app/features/home/presentation/pages/home_page.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  late MockPokemonRepository repository;
  late MockHomeCubit cubit;

  setUp(() {
    repository = MockPokemonRepository();
    cubit = MockHomeCubit();
    Modular.bindModule(HomeModule()); // importante!
    Modular.replaceInstance<HomeCubit>(cubit);
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<HomeCubit>.value(
        value: cubit,
        child: HomePage(
          cubit: cubit,
        ),
      ),
    );
  }

  testWidgets('exibe mensagem de erro quando estado é HomeError',
      (tester) async {
    when(() => cubit.state).thenReturn(HomeError('Erro ao carregar'));
    when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Erro ao carregar dados.'), findsOneWidget);
  });

  testWidgets('exibe lista quando estado é PokemonListLoaded', (tester) async {
    final pokemons = PokemonListResponse(
      count: 1,
      next: null,
      previous: null,
      results: [
        PokemonListItem(
            name: 'bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/')
      ],
    );

    whenListen(
      cubit,
      Stream.fromIterable([PokemonListLoaded(pokemons: pokemons)]),
    );
    when(() => cubit.state).thenReturn(PokemonListLoaded(pokemons: pokemons));

    Modular.replaceInstance<HomeCubit>(cubit); // solução para Modular.get

    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(
          cubit: cubit,
        ), // sem BlocProvider se usar Modular.get
      ),
    );
    await tester.pump();

    expect(find.text('Bulbasaur'), findsOneWidget);
  });

  testWidgets('exibe mensagem "Nenhum dado." para estado inicial',
      (tester) async {
    when(() => cubit.state).thenReturn(HomeInitial());
    when(() => cubit.stream).thenAnswer((_) => const Stream.empty());

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Nenhum dado.'), findsOneWidget);
  });

  blocTest<HomeCubit, HomeState>(
    'emits [HomeLoading, PokemonListLoaded, PokemonListLoadingMore, PokemonListLoaded] when loading next page',
    build: () {
      when(() => repository.fetchPokemonList(url: any(named: 'url')))
          .thenAnswer((invocation) async {
        final url = invocation.namedArguments[#url] as String?;

        if (url == null || url == '/pokemon?limit=20&offset=0') {
          return PokemonListResponse(
            count: 40,
            next: '/pokemon?limit=20&offset=20',
            previous: null,
            results: List.generate(
              20,
              (i) => PokemonListItem(name: 'poke$i', url: 'url/$i'),
            ),
          );
        } else if (url == '/pokemon?limit=20&offset=20') {
          return PokemonListResponse(
            count: 40,
            next: null,
            previous: null,
            results: List.generate(
              20,
              (i) =>
                  PokemonListItem(name: 'poke${i + 20}', url: 'url/${i + 20}'),
            ),
          );
        }

        throw Exception('Unexpected URL: $url');
      });

      return cubit;
    },
    act: (cubit) async {
      await cubit.fetchPokemonList(); // primeira página
      await cubit.fetchPokemonList(); // segunda página
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
}
