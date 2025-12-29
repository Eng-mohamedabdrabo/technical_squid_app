import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'Home View Placeholder',
          style: AppStyles.textStyle24Bold.copyWith(color: ColorManager.primary),
        ),
      ),
    );
  }
}
