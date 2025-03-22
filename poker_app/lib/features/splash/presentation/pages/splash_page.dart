import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/core/contants.dart';
import 'package:poker_app/features/home/module/home_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Modular.to.pushNamed(HomeRoutes.homePagePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        logo,
      ),
    );
  }
}
