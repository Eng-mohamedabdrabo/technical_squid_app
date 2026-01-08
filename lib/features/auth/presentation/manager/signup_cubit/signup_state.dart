part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupAuthMethodChanged extends SignupState {
  final bool isEmail;
  SignupAuthMethodChanged(this.isEmail);
}

class SignupPhoneFocusChanged extends SignupState {
  final bool isFocused;
  SignupPhoneFocusChanged(this.isFocused);
}
