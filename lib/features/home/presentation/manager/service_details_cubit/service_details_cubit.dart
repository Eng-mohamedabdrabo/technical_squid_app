import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_details_state.dart';

class ServiceDetailsCubit extends Cubit<ServiceDetailsState> {
  final String basePrice;

  ServiceDetailsCubit({required this.basePrice})
    : super(ServiceDetailsInitial()) {
    _calculateTotal(); // Initial calculation
  }

  // Mock data for spare parts
  List<Map<String, dynamic>> spareParts = [
    {'key': 'battery', 'price': 350, 'selected': false},
    {'key': 'oilFilter', 'price': 45, 'selected': false},
    {'key': 'brakePads', 'price': 180, 'selected': false},
  ];

  void togglePartSelection(int index, bool isSelected) {
    spareParts[index]['selected'] = isSelected;
    _calculateTotal();
  }

  void _calculateTotal() {
    int total = int.tryParse(basePrice) ?? 0;
    for (var part in spareParts) {
      if (part['selected']) {
        total += (part['price'] as int);
      }
    }
    emit(ServiceDetailsPartsUpdated(List.from(spareParts), total));
  }
}
