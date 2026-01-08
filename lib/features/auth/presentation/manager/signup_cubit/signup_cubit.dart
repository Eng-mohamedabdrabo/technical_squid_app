import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  bool isEmailSignup = true;
  bool isPhoneFocused = false;

  void toggleAuthMethod() {
    isEmailSignup = !isEmailSignup;
    emit(SignupAuthMethodChanged(isEmailSignup));
  }

  void changePhoneFocus(bool isFocused) {
    if (isPhoneFocused != isFocused) {
      isPhoneFocused = isFocused;
      emit(SignupPhoneFocusChanged(isPhoneFocused));
    }
  }
}
