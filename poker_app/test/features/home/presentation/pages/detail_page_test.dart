import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';
import 'package:poker_app/features/home/data/repositories/pokemon_repository.dart';
import 'package:poker_app/features/home/module/home_module.dart';
import 'package:poker_app/features/home/presentation/cubit/detail_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';
import 'package:poker_app/features/home/presentation/pages/detail_page.dart';
import 'package:bloc_test/bloc_test.dart';

class MockDetailCubit extends Mock implements DetailCubit {}

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late MockPokemonRepository mockRepository;

  late MockDetailCubit mockCubit;

  setUp(() {
    mockRepository = MockPokemonRepository();
    mockCubit = MockDetailCubit();
    Modular.replaceInstance<PokemonRepository>(mockRepository);
     Modular.bindModule(HomeModule().binds(i
      .bindSingleton<DetailCubit>((i) => mockCubit));
  });

  testWidgets('exibe detalhes quando estado é PokemonDetailLoaded',
      (tester) async {
    final pokemon = Pokemon(id: 1, name: 'bulbasaur');

    // Configura o Cubit para emitir o estado desejado
    when(() => mockCubit.state)
        .thenReturn(PokemonDetailLoaded(pokemon: pokemon));
    whenListen(
      mockCubit,
      Stream<HomeState>.fromIterable([
        PokemonDetailLoaded(pokemon: pokemon),
      ]),
    );

    // Renderiza a página com BlocProvider.value para injetar o mockCubit
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<DetailCubit>.value(
          value: mockCubit,
          child: const PokemonDetailPage(pokemonId: 1),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verifica se o nome do Pokémon aparece
    expect(find.text('bulbasaur'), findsOneWidget);
  });
}
