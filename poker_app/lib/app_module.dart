import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/app_routes.dart';
import 'package:poker_app/features/home/module/home_module.dart';
import 'package:poker_app/features/splash/module/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  void routes(r) {
    r
      ..module(AppRoutes.splashPagePath, module: SplashModule())
      ..module(AppRoutes.homePagePath, module: HomeModule());
  }
}
