enum PropertyType { sale, rent }

class PropertyTestModel {
  final int id;
  final String title;
  final String price;
  final String location;
  final String imageUrl;
  final int beds;
  final int baths;
  final int area;
  final PropertyType type;

  PropertyTestModel({
    required this.id,
    required this.title,
    required this.price,
    required this.location,
    required this.imageUrl,
    required this.beds,
    required this.baths,
    required this.area,
    required this.type,
  });
}
