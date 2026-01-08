part of 'service_details_cubit.dart';

abstract class ServiceDetailsState {}

class ServiceDetailsInitial extends ServiceDetailsState {}

class ServiceDetailsPartsUpdated extends ServiceDetailsState {
  final List<Map<String, dynamic>> spareParts;
  final int totalPrice;

  ServiceDetailsPartsUpdated(this.spareParts, this.totalPrice);
}
