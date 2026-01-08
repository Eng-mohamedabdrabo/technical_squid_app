class CartItemModel {
  final String id;
  final String title;
  final String serviceType;
  final String imagePath;
  final double price;
  int quantity;
  final List<String> spareParts;
  final double sparePartsPrice;

  CartItemModel({
    required this.id,
    required this.title,
    required this.serviceType,
    required this.imagePath,
    required this.price,
    this.quantity = 1,
    this.spareParts = const [],
    this.sparePartsPrice = 0.0,
  });

  double get totalPrice => (price * quantity) + sparePartsPrice;
}
