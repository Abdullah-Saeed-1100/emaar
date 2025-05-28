import 'package:emaar/features/estate/data/models/property_test_model.dart';
import 'package:emaar/features/estate/widgets/property_detail_for_item_grid_view_home.dart';
import 'package:flutter/material.dart';

class CustomItemGridViewHome extends StatelessWidget {
  final PropertyTestModel property;

  const CustomItemGridViewHome({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(property.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // نوع العقار
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color:
                        property.type == PropertyType.sale
                            ? Colors.green
                            : Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    property.type == PropertyType.sale ? 'للبيع' : 'للإيجار',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // أيقونة المفضلة
              Positioned(
                top: 12,
                left: 12,
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   if (isFavorite) {
                    //     _favorites.remove(property.id);
                    //   } else {
                    //     _favorites.add(property.id);
                    //   }
                    // });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      // isFavorite ? Icons.favorite : Icons.favorite_border,
                      // color: isFavorite ? Colors.red : Colors.grey[600],
                      Icons.favorite_border,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // المعلومات
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey[500], size: 14),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        property.location,
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // تفاصيل العقار
                Row(
                  children: [
                    PropertyDetailForItemGridViewHome(
                      icon: Icons.bed,
                      text: '${property.beds}',
                    ),
                    SizedBox(width: 16),
                    PropertyDetailForItemGridViewHome(
                      icon: Icons.bathtub,
                      text: '${property.baths}',
                    ),
                    SizedBox(width: 16),
                    PropertyDetailForItemGridViewHome(
                      icon: Icons.square_foot,
                      text: '${property.area} م²',
                    ),
                  ],
                ),
                SizedBox(height: 12),
                // السعر
                Text(
                  property.price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1976D2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
