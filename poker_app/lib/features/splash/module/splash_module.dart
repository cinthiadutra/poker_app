
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/features/splash/presentation/pages/splash_page.dart';

class SplashModule extends Module {
  @override

  @override
  void binds(i) {
    // i.add();
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
  }
}
