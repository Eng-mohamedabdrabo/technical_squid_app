import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  int currentIndex = 0;
  final PageController pageController = PageController();

  void updateIndex(int index) {
    currentIndex = index;
    emit(OnboardingPageChanged(index));
  }

  void nextPage(BuildContext context, VoidCallback onComplete) {
    if (currentIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      onComplete();
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
