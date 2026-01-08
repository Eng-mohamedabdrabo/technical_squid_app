import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_squid_app/core/utils/assets.dart';
import 'package:technical_squid_app/features/cart/data/models/cart_item_model.dart';
import 'package:technical_squid_app/features/cart/presentation/manager/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState()) {
    _loadMockItems();
  }

  void _loadMockItems() {
    final mockItems = [
      CartItemModel(
        id: '1',
        title: 'Oil Change',
        serviceType: 'Regular Maintenance',
        imagePath: Assets.service,
        price: 150.0,
        spareParts: ['Filter', 'Oil 5W-30'],
        sparePartsPrice: 200.0,
      ),
      CartItemModel(
        id: '2',
        title: 'Brake Check',
        serviceType: 'Safety Inspection',
        imagePath: Assets.service,
        price: 100.0,
        spareParts: ['Brake Pads'],
        sparePartsPrice: 350.0,
      ),
    ];
    emit(state.copyWith(items: mockItems));
  }

  void nextStep() {
    if (state.currentStep < 3) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void prevStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void incrementItem(String id) {
    final newItems = state.items.map((item) {
      if (item.id == id) {
        item.quantity++;
      }
      return item;
    }).toList();
    emit(state.copyWith(items: newItems)); // Trigget rebuild
  }

  void decrementItem(String id) {
    final newItems = state.items.map((item) {
      if (item.id == id && item.quantity > 1) {
        item.quantity--;
      }
      return item;
    }).toList();
    emit(state.copyWith(items: newItems));
  }

  void toggleCompatibility() {
    emit(state.copyWith(isCompatible: !state.isCompatible));
  }

  void setPaymentMethod(PaymentMethod method) {
    emit(state.copyWith(paymentMethod: method));
  }

  void confirmOrder() {
    emit(state.copyWith(isOrderConfirmed: true));
  }
}
