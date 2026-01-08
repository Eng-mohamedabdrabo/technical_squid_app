import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int activeIndex = 0;
  String? selectedBrand;
  String? selectedModel;
  String? selectedYear;
  String? selectedServiceType;

  void changeModelIndex(int index) {
    activeIndex = index;
    emit(HomeModelSelected(index));
  }

  void changeBrand(String? brand) {
    selectedBrand = brand;
    emit(HomeBrandSelected(brand));
  }

  void changeModel(String? model) {
    selectedModel = model;
    emit(HomeCarModelSelected(model));
  }

  void changeYear(String? year) {
    selectedYear = year;
    emit(HomeYearSelected(year));
  }

  void changeServiceType(String? type) {
    selectedServiceType = type;
    emit(HomeServiceTypeSelected(type));
  }
}
