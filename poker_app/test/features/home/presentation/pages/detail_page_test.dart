import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poker_app/features/home/presentation/pages/detail_page.dart';
import 'package:poker_app/features/home/presentation/cubit/detail_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';

class MockDetailCubit extends Mock implements DetailCubit {}

void main() {
  late MockDetailCubit mockCubit;

  setUp(() {
    mockCubit = MockDetailCubit();

    when(() => mockCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockCubit.state).thenReturn(HomeLoading());
    when(() => mockCubit.fetchPokemonDetail(any())).thenAnswer((_) async {});
    when(() => mockCubit.close()).thenAnswer((_) async {});

  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: BlocProvider<DetailCubit>.value(
        value: mockCubit,
        child: PokemonDetailPage(pokemonId: 1, injectedCubit: mockCubit),
      ),
    );
  }

  testWidgets('exibe loading quando estado for HomeLoading', (tester) async {
    await tester.pumpWidget(buildTestableWidget());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('exibe erro quando estado for HomeError', (tester) async {
    when(() => mockCubit.state).thenReturn(const HomeError('Erro'));
    await tester.pumpWidget(buildTestableWidget());
    await tester.pump(); // para atualizar UI após o estado

    expect(find.text('Erro ao carregar detalhes.'), findsOneWidget);
  });
}
