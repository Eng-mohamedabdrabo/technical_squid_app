import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorManager.lightBackground,
              Color(0xFFEBE7DF), // Slightly darker shade for subtle depth
            ],
          ),
        ),
        child: const SplashViewBody(),
      ),
    );
  }
}
