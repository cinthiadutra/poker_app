import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/app_module.dart';
import 'package:poker_app/core/utils/app_colors.dart';

void main() async {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()) );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'pokerAPP',
   
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secundary, primary: AppColors.primary),
        useMaterial3: true,
      ),routerConfig: Modular.routerConfig,
    );
  }
}


  
  
  

  
  
  
  