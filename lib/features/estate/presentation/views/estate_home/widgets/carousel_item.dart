import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/entities/property_entity.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../estate_details/estate_details_view.dart';

class CarouselItem extends StatelessWidget {
  final PropertyEntity property;
  final bool isLoading;
  const CarouselItem({
    super.key,
    required this.property,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to property details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EstateDetailsView(property: property),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            isLoading
                ? BoxShadow(color: Colors.grey.withOpacity(0.2))
                : BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
          ],
        ),
        child: Stack(
          children: [
            // الصورة
            if (!isLoading)
              CachedNetworkImage(
                imageUrl: property.image,
                imageBuilder:
                    (context, imageProvider) => Container(
                      // width: double.infinity,
                      // height: 280, // نفس ارتفاع pageView
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                errorWidget:
                    (context, url, error) => Container(
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
                          image: AssetImage(AppImages.homeAppBarBackground),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              ),
            // التدرج
            if (!isLoading)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
            // النص
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white70, size: 16),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${property.city}, ${property.address}',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    property.price.toInt().toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // نوع العقار
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color:
                      property.status == "للبيع" ? Colors.green : Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  property.status == "للبيع" ? 'للبيع' : 'للإيجار',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
