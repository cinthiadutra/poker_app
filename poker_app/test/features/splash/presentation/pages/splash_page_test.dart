import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/features/splash/presentation/pages/splash_page.dart';
import 'package:poker_app/core/contants.dart';

class ModularNavigatorMock extends Mock implements IModularNavigator {}

void main() {
  late ModularNavigatorMock modularNavigator;

  setUp(() {
    modularNavigator = ModularNavigatorMock();
    Modular.navigatorDelegate = modularNavigator;
  });

  testWidgets('SplashPage exibe a logo e navega após o delay', (tester) async {
    when(() => modularNavigator.navigate(any())).thenAnswer((_) async {});

    await tester.pumpWidget(const MaterialApp(
        home: SplashPage(delay: Duration(milliseconds: 100))));

    // Verifica se a logo está na tela
    expect(find.byType(Image), findsOneWidget);
    expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Image && (widget.image as AssetImage).assetName == logo,
        ),
        findsOneWidget);

    // Avança o tempo para disparar o Future.delayed
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pumpAndSettle();

    // Verifica se a navegação foi chamada
    verify(() => modularNavigator.navigate(any())).called(1);
  });
}
