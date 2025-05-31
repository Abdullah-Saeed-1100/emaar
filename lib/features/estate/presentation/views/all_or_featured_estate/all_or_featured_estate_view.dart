import 'package:emaar/core/entities/property_entity.dart';
import 'package:emaar/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../estate_home/widgets/custom_item_grid_view_home.dart';

class AllOrFeaturedEstateView extends StatelessWidget {
  final List<PropertyEntity> properties;
  final bool isFeatured;
  const AllOrFeaturedEstateView({
    super.key,
    required this.isFeatured,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        title: Text(isFeatured ? 'العقارات المميزة' : 'جميع العقارات'),
        centerTitle: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: properties.length,
          itemBuilder: (context, index) {
            return CustomItemGridViewHome(property: properties[index]);
          },
        ),
      ),
    );
  }
}
