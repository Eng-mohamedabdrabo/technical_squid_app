import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import bloc
import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:technical_squid_app/core/utils/color_manager.dart';
import 'package:technical_squid_app/core/widgets/custom_button.dart';
import 'package:technical_squid_app/core/widgets/custom_language_selector.dart';
import 'package:go_router/go_router.dart';
import 'package:technical_squid_app/core/utils/app_router.dart';
import 'package:technical_squid_app/features/onboarding/presentation/manager/onboarding_cubit/onboarding_cubit.dart';
import 'package:technical_squid_app/features/onboarding/presentation/views/widgets/onboarding_page_item.dart';
import 'package:technical_squid_app/generated/l10n.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide Cubit here since this might be the top level for onboarding logic
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Builder(
        // Builder to access context.read
        builder: (context) {
          final cubit = context.read<OnboardingCubit>();
          final s = S.of(context);

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
                        onPressed: () async {
                          // Complete onboarding
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('isOnboardingSeen', true);
                          if (context.mounted) {
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.kHomeView);
                          }
                        },
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
                BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    final currentIndex = cubit.currentIndex;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: currentIndex == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? ColorManager.accent
                                : ColorManager.accent.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    );
                  },
                ),

                const SizedBox(height: 16),

                // PageView
                Expanded(
                  child: PageView(
                    controller: cubit.pageController,
                    onPageChanged: (index) {
                      cubit.updateIndex(index);
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
                  child: BlocBuilder<OnboardingCubit, OnboardingState>(
                    builder: (context, state) {
                      final isLastPage = cubit.currentIndex == 2;
                      return CustomButton(
                        text: isLastPage ? s.getStarted : s.next,
                        onPressed: () {
                          cubit.nextPage(context, () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('isOnboardingSeen', true);
                            if (context.mounted) {
                              GoRouter.of(
                                context,
                              ).pushReplacement(AppRouter.kHomeView);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }
}
