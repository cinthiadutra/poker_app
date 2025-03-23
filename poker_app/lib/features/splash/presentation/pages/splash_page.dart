import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poker_app/app_routes.dart';
import 'package:poker_app/core/contants.dart';
import 'package:poker_app/core/utils/app_colors.dart';

class SplashPage extends StatefulWidget {
  final Duration delay;

  const SplashPage({super.key, this.delay = const Duration(seconds: 3)});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        Modular.to.navigate(AppRoutes.homePagePath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(logo),
      ),
    );
  }
}
