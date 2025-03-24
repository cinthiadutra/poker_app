import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poker_app/app_module.dart';
import 'package:poker_app/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:poker_app/main.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  late MockFirebaseAnalytics analytics;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Mock da inicialização do Firebase
    setupFirebaseCoreMocks();
    analytics = MockFirebaseAnalytics();
    await Firebase.initializeApp();
  });

  testWidgets('AppModule deve inicializar SplashPage corretamente',
      (tester) async {
    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child: AppWidget(),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('AppModule deve navegar para HomeModule', (tester) async {
    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child: AppWidget(),
      ),
    );

    await tester.pumpAndSettle();
    Modular.to.navigate(AppRoutes.homePagePath);
    await tester.pumpAndSettle();

    expect(find.textContaining('Home'), findsWidgets);
  });

   testWidgets('SplashPage deve mostrar imagem e navegar para login', (tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      ModularApp(
        module: AppModule(),
        child:  AppWidget(),
      ),
    );

    // Verifica se a splash está exibindo a imagem (ajuste o tipo do widget se for outro)
    expect(find.byType(Image), findsOneWidget);

    // Espera até o tempo que a splash faz a navegação (ex: 3 segundos)
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Verifica se navegou para a tela de login
    expect(find.text('Login'), findsOneWidget); // ou outro identificador visível da tela de login
  });
}

MockNavigatorObserver() {
}
