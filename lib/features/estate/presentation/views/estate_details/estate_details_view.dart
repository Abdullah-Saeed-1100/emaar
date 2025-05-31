import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/custom_bottom_navigation_bar_details.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/estate_information_section.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/main_and_sub_images_section_details.dart';
import 'package:flutter/material.dart';
import '../../../../../core/entities/property_entity.dart';

class EstateDetailsView extends StatelessWidget {
  final PropertyEntity property;
  final bool fromFeaturedSection;
  const EstateDetailsView({
    super.key,
    required this.property,
    required this.fromFeaturedSection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Main Image and Sub Images Section
            MainAndSubImagesSectionDetails(
              estateImages: mainImageAndSubImages(),
              tagHero:
                  // إذا كانت من قسم المميز أو لا
                  "${property.id}-$fromFeaturedSection", // ex: "1-true" or "1-false"
            ),
            SizedBox(height: 20),

            // estate Information Section
            EstateInformationSection(property: property),

            SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBarDetails(),
    );
  }

  // هذه الدالة تعيد قائمة الصورة الرئيسية والصور الفرعية
  List<String> mainImageAndSubImages() => [
    property.mainImageUrl,
    ...property.subImagesUrls,
  ];
}
