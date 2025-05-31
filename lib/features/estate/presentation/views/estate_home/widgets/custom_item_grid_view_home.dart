import 'package:cached_network_image/cached_network_image.dart';
import 'package:emaar/core/entities/property_entity.dart';
import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/core/utils/app_images.dart';
import 'package:emaar/core/utils/app_text_styles.dart';
import 'package:emaar/features/estate/presentation/views/estate_home/widgets/property_detail_for_item_grid_view_home.dart';
import 'package:flutter/material.dart';

import '../../estate_details/estate_details_view.dart';

class CustomItemGridViewHome extends StatelessWidget {
  final PropertyEntity property;

  const CustomItemGridViewHome({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to property details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => EstateDetailsView(
                  property: property,
                  fromFeaturedSection: false,
                ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),

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
            AspectRatio(
              aspectRatio: 2 / 1, // نسبة العرض إلى الارتفاع
              child: Stack(
                children: [
                  Hero(
                    tag: "${property.id}-false",
                    child: CachedNetworkImage(
                      imageUrl: property.image,
                      imageBuilder:
                          (context, imageProvider) => Container(
                            // height: 200,
                            // width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.only(
                              //   bottomLeft: Radius.circular(8),
                              //   bottomRight: Radius.circular(8),
                              // ),
                              image: DecorationImage(
                                // image: NetworkImage(property.imageUrl),
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: AppColors.primary,
                            ),
                          ),
                      errorWidget:
                          (context, url, error) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.logo),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    ),
                  ),
                  // نوع العقار
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color:
                            property.status == "للبيع"
                                ? Colors.green
                                : AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        property.status == "للبيع" ? 'للبيع' : 'للإيجار',
                        style: AppTextStyles.body12.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // أيقونة المفضلة
                  Positioned(
                    top: 6,
                    left: 6,
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
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          // isFavorite ? Icons.favorite : Icons.favorite_border,
                          // color: isFavorite ? Colors.red : Colors.grey[600],
                          Icons.favorite_border,
                          // color: AppColors.primary,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // المعلومات
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: AppTextStyles.body16.copyWith(color: Colors.black),
                    // style: TextStyle(
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.grey[800],
                    // ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[500],
                        size: 14,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${property.city}, ${property.address}',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 13,
                          ),
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
                        text: '${property.bedrooms}',
                      ),
                      SizedBox(width: 16),
                      PropertyDetailForItemGridViewHome(
                        icon: Icons.bathtub,
                        text: '${property.bathrooms}',
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
                    '${property.price.toInt()} ريال',
                    style: AppTextStyles.heading20.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      // color: Color(0xFF1976D2),
                    ),
                    // style: TextStyle(
                    //   fontSize: 18,
                    //   fontWeight: FontWeight.bold,
                    //   color: Color(0xFF1976D2),
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
