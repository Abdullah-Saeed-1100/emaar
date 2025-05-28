import 'package:emaar/features/estate/data/models/dummy_data.dart';
import 'package:emaar/features/estate/widgets/custom_carousel_view_sliver_home.dart';
import 'package:emaar/features/estate/widgets/custom_grid_view_home.dart';
import 'package:emaar/features/estate/widgets/custom_sliver_app_bar_home.dart';
import 'package:emaar/features/estate/widgets/header_all_property.dart';
import 'package:emaar/features/estate/widgets/header_special_property.dart';
import 'package:flutter/material.dart';

class EstateHomeViewBody extends StatelessWidget {
  const EstateHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar - الجزء الأول
        CustomSliverAppBarHome(),

        // CarouselView - الجزء الثاني
        HeaderSpecialProperty(),
        CustomCarouselViewSliverHome(),

        // GridView - الجزء الثالث
        HeaderAllProperty(),
        CustomGridViewHome(allProperties: dummyProperties()),
      ],
    );
  }
}
