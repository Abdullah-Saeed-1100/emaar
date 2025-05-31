import 'package:emaar/core/utils/app_colors.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/custom_bottom_navigation_bar_details.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/estate_information_section.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/main_image_section_details.dart';
import 'package:emaar/features/estate/presentation/views/estate_details/widgets/sub_images_section_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/property_entity.dart';
import '../../cubits/navigate_between_images_details_cubit/navigate_between_images_details_cubit.dart';

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
            MainAndSubImagesSectionDetails(
              estateImages: mainImageAndSubImages(),
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

class MainAndSubImagesSectionDetails extends StatelessWidget {
  final List<String> estateImages;
  const MainAndSubImagesSectionDetails({super.key, required this.estateImages});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigateBetweenImagesDetailsCubit(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainImageSectionDetails(estateImages: estateImages),
          SizedBox(height: 16),
          SubImagesSectionDetails(estateImages: estateImages),
        ],
      ),
    );
  }
}
