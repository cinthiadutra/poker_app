import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/app_module.dart';
import 'package:poker_app/core/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(ModularApp(module: AppModule(), child:  AppWidget()));
}

class AppWidget extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'pokerAPP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.secundary, primary: AppColors.primary),
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
