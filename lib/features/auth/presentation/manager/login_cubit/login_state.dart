part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginAuthMethodChanged extends LoginState {
  final bool isEmail;
  LoginAuthMethodChanged(this.isEmail);
}

class LoginPhoneFocusChanged extends LoginState {
  final bool isFocused;
  LoginPhoneFocusChanged(this.isFocused);
}
