part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeModelSelected extends HomeState {
  final int index;
  HomeModelSelected(this.index);
}

class HomeBrandSelected extends HomeState {
  final String? brand;
  HomeBrandSelected(this.brand);
}

class HomeCarModelSelected extends HomeState {
  final String? model;
  HomeCarModelSelected(this.model);
}

class HomeYearSelected extends HomeState {
  final String? year;
  HomeYearSelected(this.year);
}

class HomeServiceTypeSelected extends HomeState {
  final String? type;
  HomeServiceTypeSelected(this.type);
}
