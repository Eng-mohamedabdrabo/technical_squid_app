import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isEmailLogin = true;
  bool isPhoneFocused = false;

  void toggleAuthMethod() {
    isEmailLogin = !isEmailLogin;
    emit(LoginAuthMethodChanged(isEmailLogin));
  }

  void changePhoneFocus(bool isFocused) {
    if (isPhoneFocused != isFocused) {
      isPhoneFocused = isFocused;
      emit(LoginPhoneFocusChanged(isPhoneFocused));
    }
  }
}
