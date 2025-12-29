import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _navigateToOnboarding();
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Slow, smooth, cinematic
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutSine),
    );

    _animationController.forward();
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingView()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection
                    .ltr, // Strictly enforce Text Left, Shape Right
                children: [
                  // Logo Text (Left)
                  SvgPicture.asset(
                    Assets.logoText,
                    height: 90,
                    colorFilter: const ColorFilter.mode(
                      ColorManager.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Logo Shape (Right)
                  SvgPicture.asset(
                    Assets.logoShape,
                    height: 120,
                    colorFilter: const ColorFilter.mode(
                      ColorManager.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
