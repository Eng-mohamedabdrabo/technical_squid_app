import 'package:flutter/material.dart';

import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/widgets/custom_button.dart';
import 'package:technical_squid_app/core/widgets/custom_language_selector.dart';
import 'package:technical_squid_app/features/home/presentation/views/home_view.dart';
import 'package:technical_squid_app/features/onboarding/presentation/views/widgets/onboarding_page_item.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _skipOnboarding() {
    _completeOnboarding();
  }

  void _completeOnboarding() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isLastPage = _currentIndex == 2;

    return SafeArea(
      child: Column(
        children: [
          // Header: Language Dropdown & Skip
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomLanguageSelector(),
                TextButton(
                  onPressed: _skipOnboarding,
                  child: Text(
                    s.skip,
                    style: const TextStyle(
                      color: ColorManager.textSecondary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Progress Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentIndex == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? ColorManager.accent
                      : ColorManager.accent.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          // PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                OnboardingPageItem(
                  title: s.onboardingTitle1,
                  subTitle: s.onboardingSubTitle1,
                  image: Assets.firstOnBoardingPic,
                ),
                OnboardingPageItem(
                  title: s.onboardingTitle2,
                  subTitle: s.onboardingSubTitle2,
                  image: Assets.secondOnBoardingPic,
                ),
                OnboardingPageItem(
                  title: s.onboardingTitle3,
                  subTitle: s.onboardingSubTitle3,
                  image: Assets.thirdOnBoardingPic,
                ),
              ],
            ),
          ),

          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: CustomButton(
              text: isLastPage ? s.getStarted : s.next,
              onPressed: _nextPage,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
