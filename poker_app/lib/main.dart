import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/core/utils/app_colors.dart';
import 'package:poker_app/features/home/module/home_module.dart';

void main() async {
  runApp(ModularApp(module: HomeModule(), child: const AppWidget()) );
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Maitha Marvel',
   
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secundary, primary: AppColors.primary),
        useMaterial3: true,
      ),routerConfig: Modular.routerConfig,
    );
  }
}


  
  
  

  
  
  
  