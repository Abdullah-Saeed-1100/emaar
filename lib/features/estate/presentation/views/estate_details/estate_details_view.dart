import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/custom_bottom_navigation_bar_details.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/estate_information_section.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/main_and_sub_images_section_details.dart';
import 'package:flutter/material.dart';
import '../../../../../core/entities/property_entity.dart';

class EstateDetailsView extends StatefulWidget {
  final PropertyEntity property;
  const EstateDetailsView({super.key, required this.property});

  @override
  EstateDetailsViewState createState() => EstateDetailsViewState();
}

class EstateDetailsViewState extends State<EstateDetailsView> {
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
              tagHero: "${widget.property.id} isFeatured",
            ),
            SizedBox(height: 20),

            // estate Information Section
            EstateInformationSection(),

            SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: CustomBottomNavigationBarDetails(),
    );
  }

  // هذه الدالة تعيد قائمة الصورة الرئيسية والصور الفرعية
  List<String> mainImageAndSubImages() => [
    widget.property.image,
    ...widget.property.images,
  ];
}
