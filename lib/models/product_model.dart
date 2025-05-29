class ProductModel {
  final String id;
  final String name;
  final double price;
  final String image;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data, String documentId) {
    return ProductModel(
      id: documentId,
      name: data['name'] ?? '',
      price: (data['price'] is num) ? (data['price'] as num).toDouble() : 0.0,
      image: data['image'] ?? '',
    );
  }
}
