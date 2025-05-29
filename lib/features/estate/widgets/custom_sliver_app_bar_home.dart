import 'dart:developer';

import 'package:emaar/core/utils/app_images.dart';
import 'package:emaar/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/repos/estate_repo/estate_repo.dart' show EstateRepo;
import '../../../core/services/supabase_database_service.dart';
import '../../../main.dart';
import '../../../core/models/property_model.dart';

class CustomSliverAppBarHome extends StatelessWidget {
  const CustomSliverAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: false,
      stretch: true,
      elevation: 0,
      backgroundColor: Colors.black12,
      // backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.homeAppBarBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Gradient overlay
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black87,
                    Colors.black38,
                    // Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            // Title and subtitle
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('مرحباً بك في', style: AppTextStyles.body14),
                            Text('إعمار', style: AppTextStyles.heading26),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            // try {
                            // final data =
                            //     await supabase.from('property').select();
                            // final List<PropertyModel> properties =
                            //     data
                            //         .map<PropertyModel>(
                            //           (item) => PropertyModel.fromJson(item),
                            //         )
                            //         .toList();
                            // final data = await SupabaseDatabaseService.fetch(
                            //   table: "property",
                            // );
                            // final List<PropertyModel> properties =
                            //     data
                            //         .map<PropertyModel>(
                            //           (item) => PropertyModel.fromJson(item),
                            //         )
                            //         .toList();

                            //   log(
                            //     'Fetched data: ${properties.first.toString()}',
                            //   );
                            // } on Exception catch (e) {
                            //   log('Error fetching data: $e');
                            // }
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Search bar at the bottom
      // bottom: PreferredSize(
      //   preferredSize: Size.fromHeight(60),
      //   child: Container(
      //     color: AppColors.primaryBackground,
      //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(8),
      //         border: Border.all(color: Colors.grey[300]!),
      //       ),
      //       child: TextField(
      //         textAlign: TextAlign.right,
      //         decoration: InputDecoration(
      //           hintText: 'ابحث عن عقار...',
      //           hintStyle: TextStyle(color: Colors.grey[500]),
      //           prefixIcon: Icon(Icons.tune, color: Colors.grey[600]),
      //           suffixIcon: Icon(Icons.search, color: Colors.grey[600]),
      //           border: InputBorder.none,
      //           contentPadding: EdgeInsets.symmetric(
      //             horizontal: 16,
      //             vertical: 12,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
