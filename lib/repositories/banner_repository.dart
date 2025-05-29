import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/banner_model.dart';

class BannerRepository {
  final CollectionReference bannerCollection =
      FirebaseFirestore.instance.collection('banners');

  Future<List<BannerModel>> fetchBanners() async {
    final snapshot = await bannerCollection.get();
    return snapshot.docs
        .map((doc) => BannerModel.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
