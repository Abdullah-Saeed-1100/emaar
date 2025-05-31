import '../entities/property_entity.dart';

class PropertyModel {
  final int id;
  final DateTime createdAt;
  final String title;
  final String description;
  final int price;
  final String status;
  final String city;
  final String address;
  final bool isFeatured;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final String mainImageUrl;
  final List<String> subImagesUrls;

  PropertyModel({
    required this.id,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.price,
    required this.status,
    required this.city,
    required this.address,
    required this.isFeatured,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.mainImageUrl,
    required this.subImagesUrls,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      status: json['status'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      isFeatured: json['is_featured'] as bool,
      bedrooms: json['bedrooms'] as int,
      bathrooms: json['bathrooms'] as int,
      area: json['area'] as int,
      mainImageUrl: json['main_image'] as String,
      subImagesUrls: List<String>.from(json['sub_images_urls']),
    );
  }

  PropertyEntity toEntity() {
    return PropertyEntity(
      id: id,
      // createdAt: createdAt,
      title: title,
      description: description,
      price: price,
      status: status,
      city: city,
      address: address,
      isFeatured: isFeatured,
      bedrooms: bedrooms,
      bathrooms: bathrooms,
      area: area,
      mainImageUrl: mainImageUrl,
      subImagesUrls: subImagesUrls,
    );
  }
}
