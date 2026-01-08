import 'package:equatable/equatable.dart';
import 'package:technical_squid_app/features/cart/data/models/cart_item_model.dart';

enum PaymentMethod { cash, visa }

class CartState extends Equatable {
  final int currentStep;
  final List<CartItemModel> items;
  final bool isCompatible;
  final PaymentMethod paymentMethod;
  final bool isOrderConfirmed;

  const CartState({
    this.currentStep = 0,
    this.items = const [],
    this.isCompatible = true,
    this.paymentMethod = PaymentMethod.cash,
    this.isOrderConfirmed = false,
  });

  double get totalServicePrice =>
      items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get totalSparePartsPrice =>
      items.fold(0, (sum, item) => sum + item.sparePartsPrice);
  double get totalTax =>
      (totalServicePrice + totalSparePartsPrice) * 0.15; // 15% VAT
  double get finalTotal => totalServicePrice + totalSparePartsPrice + totalTax;

  CartState copyWith({
    int? currentStep,
    List<CartItemModel>? items,
    bool? isCompatible,
    PaymentMethod? paymentMethod,
    bool? isOrderConfirmed,
  }) {
    return CartState(
      currentStep: currentStep ?? this.currentStep,
      items: items ?? this.items,
      isCompatible: isCompatible ?? this.isCompatible,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      isOrderConfirmed: isOrderConfirmed ?? this.isOrderConfirmed,
    );
  }

  @override
  List<Object> get props => [
    currentStep,
    items,
    isCompatible,
    paymentMethod,
    isOrderConfirmed,
  ];
}
