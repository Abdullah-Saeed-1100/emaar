import 'package:emaar/features/estate/presentation/cubits/navigate_between_images_details_cubit/navigate_between_images_details_cubit.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/main_image_section_details.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/sub_images_section_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAndSubImagesSectionDetails extends StatelessWidget {
  final String tagHero;
  final List<String> estateImages;
  const MainAndSubImagesSectionDetails({
    super.key,
    required this.estateImages,
    required this.tagHero,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigateBetweenImagesDetailsCubit(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainImageSectionDetails(estateImages: estateImages, tagHero: tagHero),
          SizedBox(height: 16),
          SubImagesSectionDetails(estateImages: estateImages),
        ],
      ),
    );
  }
}
