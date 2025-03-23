import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/features/home/data/models/pokemon_model.dart';
import 'package:poker_app/features/home/module/home_module.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';
import 'package:poker_app/features/home/presentation/pages/detail_page.dart';
import 'package:poker_app/features/home/presentation/cubit/detail_cubit.dart';
import 'package:flutter/material.dart';

class MockDetailCubit extends Mock implements DetailCubit {}

void main() {
  late MockDetailCubit mockDetailCubit;

  setUp(() {
    mockDetailCubit = MockDetailCubit();

    // Reseta os binds antes de cada teste
    Modular.bindModule(
      HomeModule().call()..bindSingleton<DetailCubit>((i) => mockDetailCubit),
    );
  });

  testWidgets('exibe detalhes quando estado é PokemonDetailLoaded',
      (WidgetTester tester) async {
    final pokemonDetail = Pokemon(
      name: 'bulbasaur',
      types: [Type()],
      abilities: [Ability()],
      height: 7,
      weight: 69,
    );

    when(() => mockDetailCubit.state)
        .thenReturn(PokemonDetailLoaded(pokemon: pokemonDetail));
    when(() => mockDetailCubit.fetchPokemonDetail(any()))
        .thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: ModularApp(
          module: HomeModule().call()
            ..bindSingleton<DetailCubit>((i) => mockDetailCubit),
          child: const PokemonDetailPage(
            pokemonId: 1,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('bulbasaur'), findsOneWidget);
  });
}
