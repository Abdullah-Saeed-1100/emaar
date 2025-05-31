import 'package:cached_network_image/cached_network_image.dart';
import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/features/estate/presentation/cubits/navigate_between_images_details_cubit/navigate_between_images_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_images.dart';

class SubImagesSectionDetails extends StatelessWidget {
  const SubImagesSectionDetails({super.key, required this.estateImages});

  final List<String> estateImages;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 12),

      // alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: estateImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index + 1 == estateImages.length ? 0 : 6,
            ),
            child: GestureDetector(
              onTap: () {
                context.read<NavigateBetweenImagesDetailsCubit>().navigateTo(
                  index: index,
                );
                // setState(() {
                //   selectedImageIndex = index;
                // });
              },
              child: Container(
                width: 70,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        context
                                    .watch<NavigateBetweenImagesDetailsCubit>()
                                    .state ==
                                index
                            ? AppColors.primary
                            : Colors.transparent,
                    width: 3,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: estateImages[index],
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
                            height: 20,
                            width: 20,
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
          );
        },
      ),
    );
  }
}
