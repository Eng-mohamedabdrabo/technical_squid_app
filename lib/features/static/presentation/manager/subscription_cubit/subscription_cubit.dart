import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());

  bool isPhoneFocused = false;
  String? selectedSize;

  void changePhoneFocus(bool isFocused) {
    if (isPhoneFocused != isFocused) {
      isPhoneFocused = isFocused;
      emit(SubscriptionPhoneFocusChanged(isPhoneFocused));
    }
  }

  void changeCompanySize(String? size) {
    selectedSize = size;
    emit(SubscriptionSizeChanged(size));
  }
}
