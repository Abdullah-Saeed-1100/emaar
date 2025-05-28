// import 'package:emaar/core/utils/app_images.dart';
// import 'package:flutter/material.dart';

import 'package:emaar/features/estate/data/models/property_test_model.dart';
import 'package:emaar/features/estate/widgets/custom_item_grid_view_home.dart';
import 'package:flutter/material.dart';

class CustomGridViewHome extends StatelessWidget {
  final List<PropertyTestModel> allProperties;
  const CustomGridViewHome({super.key, required this.allProperties});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(childCount: allProperties.length, (
          context,
          index,
        ) {
          return CustomItemGridViewHome(property: allProperties[index]);
        }),
      ),
    );
  }
}
