part of 'orders_cubit.dart';

@immutable
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<int> orders; // Mock data: simplified list of IDs
  OrdersLoaded(this.orders);
}
