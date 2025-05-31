import 'package:cached_network_image/cached_network_image.dart';
import 'package:emaar/core/utils/app_images.dart';
import 'package:emaar/features/estate/presentation/cubits/navigate_between_images_details_cubit/navigate_between_images_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_colors.dart';

class MainImageSectionDetails extends StatelessWidget {
  final String tagHero;
  const MainImageSectionDetails({
    super.key,
    required this.estateImages,
    required this.tagHero,
  });

  final List<String> estateImages;

  @override
  Widget build(BuildContext context) {
    context
        .watch<
          NavigateBetweenImagesDetailsCubit
        >(); // لمراقبة الحالة وتحديث الواجهة تلقائيًا
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          // aspectRatio: 4 / 3, // نسبة العرض إلى الارتفاع للصورة الرئيسية
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Hero(
              tag: tagHero,
              child: CachedNetworkImage(
                imageUrl:
                    estateImages[context
                        .read<NavigateBetweenImagesDetailsCubit>()
                        .state], // استخدام الحالة من الكيوبت وتحديث تلقائي
                imageBuilder:
                    (context, imageProvider) => DecoratedBox(
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
                    (context, url, error) => DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.logo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ),
        // back button
        Positioned(
          top: 50,
          right: 12,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),

            child: Container(
              decoration: BoxDecoration(
                color: Colors.black12, // شفاف جزئياً
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
