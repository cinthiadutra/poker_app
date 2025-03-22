
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/features/home/module/home_module.dart';
import 'package:poker_app/features/splash/presentation/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        HomeModule(),
      ];
  @override
  void binds(i) {
    // i.add();
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
