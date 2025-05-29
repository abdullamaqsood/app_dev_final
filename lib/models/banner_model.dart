class BannerModel {
  final String title;
  final String subTitle;
  final String buttonText;
  final String sideText;
  final String image;

  BannerModel({
    required this.title,
    required this.subTitle,
    required this.buttonText,
    required this.sideText,
    required this.image,
  });

  factory BannerModel.fromMap(Map<String, dynamic> data) {
    return BannerModel(
      title: data['title'] ?? '',
      subTitle: data['subTitle'] ?? '',
      buttonText: data['buttonText'] ?? '',
      sideText: data['sideText'] ?? '',
      image: data['headphone'] ?? '',
    );
  }
}
