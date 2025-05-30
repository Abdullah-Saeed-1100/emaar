import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/entities/property_entity.dart';
import '../../../../../../core/functions/add_commas_to_price.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../estate_details/estate_details_view.dart';

class CarouselItem extends StatelessWidget {
  final int index;
  final PropertyEntity property;
  final bool isLoading;
  const CarouselItem({
    super.key,
    required this.property,
    this.isLoading = false,
    required this.index,
  });

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
                  fromFeaturedSection: true,
                ),
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
              Hero(
                tag: "${property.id}-true",
                child: CachedNetworkImage(
                  imageUrl: property.mainImageUrl,
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.logo),
                            fit: BoxFit.cover,
                          ),
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
                  Row(
                    children: [
                      Text(
                        addCommasToPrice(property.price.toInt()),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 6),
                      SvgPicture.asset(
                        AppImages.saudiCurrency,
                        semanticsLabel: 'Saudi Riyal',
                        width: 20,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
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
