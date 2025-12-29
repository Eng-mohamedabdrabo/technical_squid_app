import 'package:flutter/material.dart';

import 'package:technical_squid_app/core/utils/app_styles.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';

class OnboardingPageItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;

  const OnboardingPageItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  State<OnboardingPageItem> createState() => _OnboardingPageItemState();
}

class _OnboardingPageItemState extends State<OnboardingPageItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Check if we have wide screen available
            final isTablet = MediaQuery.of(context).size.width > 600;

            if (isTablet) {
              // Tablet Layout: Row (Image Left, Text Right)
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image Section
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                              if (wasSynchronouslyLoaded) {
                                return child;
                              }
                              return AnimatedOpacity(
                                opacity: frame == null ? 0 : 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOut,
                                child: child,
                              );
                            },
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  // Text Section
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align text start for cleaner look on tablet
                      children: [
                        Text(
                          widget.title,
                          style: AppStyles.textStyle40Bold.copyWith(
                            // Larger font for tablet
                            color: ColorManager.textDark,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          widget.subTitle,
                          style: AppStyles.textStyle20Medium.copyWith(
                            color: ColorManager.textSecondary,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            // Mobile Layout: Column
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // PNG Illustration
                Expanded(
                  flex: 5,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) {
                            return child;
                          }
                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                            child: child,
                          );
                        },
                  ),
                ),
                const SizedBox(height: 40),
                // Text Content
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: AppStyles.textStyle28Bold.copyWith(
                          color: ColorManager.textDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.subTitle,
                        style: AppStyles.textStyle16Medium.copyWith(
                          color: ColorManager.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
