import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/core/utils/app_images.dart';
import 'package:emaar/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/entities/property_entity.dart';
import '../../../../../../core/functions/add_commas_to_price.dart';

class EstateInformationSection extends StatelessWidget {
  final PropertyEntity property;
  const EstateInformationSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
          // Title and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  property.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    addCommasToPrice(property.price.toInt()),
                    style: AppTextStyles.heading20.copyWith(
                      // color: AppColors.primary,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 6),
                  SvgPicture.asset(
                    AppImages.saudiCurrency,
                    semanticsLabel: 'Saudi Riyal',
                    width: 20,
                    colorFilter: ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 8),

          // Location and Rating
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 20),
              SizedBox(width: 4),
              Text(
                "${property.city}, ${property.address}",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Spacer(),
              Icon(Icons.star, color: Colors.amber, size: 20),
              SizedBox(width: 4),
              Text(
                '4.8 (24 تقييم)',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Features
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFeatureItem(
                Icons.bed,
                property.bedrooms.toString(),
                'غرف نوم',
              ),
              _buildFeatureItem(
                Icons.bathtub,
                property.bathrooms.toString(),
                'حمامات',
              ),
              _buildFeatureItem(
                Icons.square_foot,
                property.area.toString(),
                'متر مربع',
              ),
            ],
          ),

          SizedBox(height: 20),

          // Description
          Text(
            'الوصف',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            property.description,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),

          SizedBox(height: 20),

          // Amenities
          Text(
            'المرافق المتوفرة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 12),
          // Amenities Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                amenities()
                    .map((amenity) => _buildAmenityChip(amenity))
                    .toList(),
          ),
          SizedBox(height: 20),

          // معلومات الوكيل
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(AppImages.me),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عبدالله سعيد',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'وكيل عقاري معتمد',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.phone, color: Colors.green),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.message, color: AppColors.primary),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // هذه الدالة تعيد قائمة المرافق المتوفرة في العقار
  List<String> amenities() => [
    'مسبح خاص',
    'موقف سيارات',
    'غرفة رياضة',
    'حديقة',
    'مطبخ مجهز',
    'تكييف مركزي',
    'أمن وحراسة',
  ];

  //
  Widget _buildAmenityChip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        // color: AppColors.primary10,
        color: Colors.grey[50],
        // color: Colors.white,
        // color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary, // أو أي لون تفضله
          width: .5,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.5,
          color: Colors.black87,
          // color: AppColors.primary,
          // color: Colors.blue[700],
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary10,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }
}
