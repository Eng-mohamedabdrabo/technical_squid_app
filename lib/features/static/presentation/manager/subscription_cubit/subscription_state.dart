part of 'subscription_cubit.dart';

@immutable
abstract class SubscriptionState {}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionPhoneFocusChanged extends SubscriptionState {
  final bool isFocused;
  SubscriptionPhoneFocusChanged(this.isFocused);
}

class SubscriptionSizeChanged extends SubscriptionState {
  final String? size;
  SubscriptionSizeChanged(this.size);
}
