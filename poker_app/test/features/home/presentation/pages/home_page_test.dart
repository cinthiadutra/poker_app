import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/features/home/data/models/pokemon_list_response.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/cubit/home_state.dart';
import 'package:poker_app/features/home/presentation/pages/home_page.dart';

class MockHomeCubit extends Mock implements HomeCubit {}

void main() {
  late MockHomeCubit mockCubit;

  setUp(() {
    mockCubit = MockHomeCubit();
  });

  testWidgets('Exibe lista de Pokémon', (WidgetTester tester) async {
    when(() => mockCubit.state).thenReturn(
      PokemonListLoaded(
        PokemonListResponse(count: 1, next: '', previous: '', results: []),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HomeCubit>(
          create: (_) => mockCubit,
          child: const HomePage(),
        ),
      ),
    );

    expect(find.text('Pokédex'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
