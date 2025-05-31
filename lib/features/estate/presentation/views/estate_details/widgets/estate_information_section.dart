import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/core/utils/app_images.dart';
import 'package:emaar/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class EstateInformationSection extends StatelessWidget {
  const EstateInformationSection({super.key});

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
                  'فيلا فاخرة مع حديقة واسعة',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                '2,500,000 ريال',
                style: AppTextStyles.heading20.copyWith(
                  color: AppColors.primary,
                ),
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
                'الرياض، حي النرجس',
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
              _buildFeatureItem(Icons.bed, '5', 'غرف نوم'),
              _buildFeatureItem(Icons.bathtub, '4', 'حمامات'),
              _buildFeatureItem(Icons.square_foot, '450', 'متر مربع'),
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
            'فيلا فاخرة تتميز بتصميم عصري وإطلالة رائعة، تحتوي على 5 غرف نوم رئيسية مع حمامات مستقلة، صالة واسعة، مطبخ مجهز بالكامل، حديقة واسعة مع مسبح خاص. الفيلا مصممة بأحدث المعايير العالمية وتقع في موقع متميز قريب من جميع الخدمات.',
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

          // Agent Information
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
        color: AppColors.primary10,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12.5,
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
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
