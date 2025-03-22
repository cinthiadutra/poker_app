import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/features/home/module/home_routes.dart';
import 'package:poker_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:poker_app/features/home/presentation/pages/home_page.dart';
import 'package:poker_app/features/splash/module/splash_module.dart';

class HomeModule extends Module {
    @override
    binds(i) {
      i.addLazySingleton((i) => HomeCubit());
    }
 
    @override
  routes(r){
      r
      ..child('/', child: (ctx) => HomePage())
      ..child('/detail', child: (ctx) => HomePage())
      ..module(HomeRoutes.splashPagePath, module: SplashModule());



 
}}