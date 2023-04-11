import 'dart:convert';

class GrillsModel {
  final int id;
  final String product;
  final String price;
  final String image;

  GrillsModel({
    required this.id,
    required this.product,
    required this.price,
    required this.image,
  });

  factory GrillsModel.fromMap(Map<String, dynamic> map) {
    return GrillsModel(
      id: map['id'] ?? 0,
      product: map['product'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'product': product,
      'price': price,
      'image': image,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory GrillsModel.fromJson(String json) =>
      GrillsModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'GrillsModel(id: $id, product: $product, price: $price, image: $image)';
  }
}
