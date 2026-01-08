import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial()) {
    fetchOrders();
  }

  void fetchOrders() {
    // Simulate fetching data
    final mockOrders = List.generate(5, (index) => index + 1);
    emit(OrdersLoaded(mockOrders));
  }
}
