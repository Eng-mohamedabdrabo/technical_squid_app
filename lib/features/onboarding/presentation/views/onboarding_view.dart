import 'package:flutter/material.dart';
import 'package:technical_squid_app/core/utils/adaptive_layout.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/onboarding/presentation/views/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBackground,
      body: AdaptiveLayout(
        mobileLayout: (context) => const OnboardingViewBody(),
        tabletLayout: (context) => const OnboardingViewBody(),
      ),
    );
  }
}
