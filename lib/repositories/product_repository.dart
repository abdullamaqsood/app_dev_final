import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductRepository {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  Future<List<ProductModel>> fetchProducts() async {
    final snapshot = await productCollection.get();
    return snapshot.docs
        .map((doc) =>
            ProductModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
