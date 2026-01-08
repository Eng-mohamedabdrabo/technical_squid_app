import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';
import 'package:technical_squid_app/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _navigateToNextScreen();
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // 1. Logo Entrance: Fade In (0.0 to 0.5)
    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // 2. Logo Entrance: Scale Down (0.0 to 0.5)
    _logoScaleAnimation = Tween<double>(begin: 1.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutCubic),
      ),
    );

    // 3. Shimmer: Slow Sweep (0.5 to 1.0)
    _shimmerAnimation = Tween<double>(begin: -1.5, end: 2.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOutSine),
      ),
    );

    _controller.forward();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () async {
      if (mounted) {
        final prefs = await SharedPreferences.getInstance();
        final isOnboardingSeen = prefs.getBool('isOnboardingSeen') ?? false;

        if (mounted) {
          if (isOnboardingSeen) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          } else {
            GoRouter.of(context).pushReplacement(AppRouter.kOnboardingView);
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Keep logo size responsive: 60% of screen width
    final double logoWidth = MediaQuery.of(context).size.width * 0.6;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(
        0xFFF9F7F3,
      ), // ColorManager.lightBackground (Hardcoded to ensure consistency)
      child: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _logoFadeAnimation.value,
              child: Transform.scale(
                scale: _logoScaleAnimation.value,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Base Logo
                    SvgPicture.asset(Assets.logo, width: logoWidth),

                    // Cinematic Shimmer Layer
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.1), // Very Subtle
                            Colors.white.withOpacity(0.5), // Soft Core
                            Colors.white.withOpacity(0.1), // Very Subtle
                            Colors.transparent,
                          ],
                          stops: [
                            _shimmerAnimation.value - 0.4,
                            _shimmerAnimation.value - 0.1,
                            _shimmerAnimation.value,
                            _shimmerAnimation.value + 0.1,
                            _shimmerAnimation.value + 0.4,
                          ],
                          tileMode: TileMode.clamp,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcATop,
                      child: SvgPicture.asset(Assets.logo, width: logoWidth),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
