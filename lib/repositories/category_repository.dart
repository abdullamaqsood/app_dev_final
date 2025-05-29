import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category_model.dart';

class CategoryRepository {
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('categories');

  Future<List<CategoryModel>> fetchCategories() async {
    final snapshot = await categoryCollection.get();
    return snapshot.docs
        .map((doc) =>
            CategoryModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
