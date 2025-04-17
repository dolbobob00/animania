class BannerModel {
  final int id;
  final String? title;
  final String? subtitle;
  final String imageUrl;
  final String link;

  BannerModel({
    required this.id,
    this.title,
    required this.imageUrl,
    required this.link,
    this.subtitle,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: json['image_url'] as String,
      link: json['link'] as String,
      subtitle: json['subtitle'] as String?,
    );
  }
}
