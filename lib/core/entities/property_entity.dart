class PropertyEntity {
  final int id;
  // final DateTime createdAt;
  final String title;
  final String description;
  final double price;
  final String status;
  final String city;
  final String address;
  final bool isFeatured;
  final int bedrooms;
  final int bathrooms;
  final String area;
  final String image;
  final List<String> images;

  PropertyEntity({
    required this.id,
    // required this.createdAt,
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
    required this.image,
    required this.images,
  });
}
