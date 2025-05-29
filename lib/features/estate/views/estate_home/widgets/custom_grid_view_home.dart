import 'package:emaar/features/estate/presentation/cubits/home_cubit.dart';
import 'package:emaar/features/estate/views/estate_home/widgets/custom_item_grid_view_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../data/models/dummy_data.dart';
import '../../../presentation/cubits/home_state.dart';

class CustomGridViewHome extends StatelessWidget {
  const CustomGridViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      sliver: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return SliverList.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: true,
                  child: CustomItemGridViewHome(
                    property: dummyProperties().first,
                  ),
                );
              },
            );
          } else if (state is HomeSuccessState) {
            return SliverList.builder(
              itemCount: state.properties.length,
              itemBuilder: (context, index) {
                return CustomItemGridViewHome(
                  property: state.properties[index],
                );
              },
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return CustomItemGridViewHome(property: dummyProperties()[index]);
            }, childCount: 0),
          );
        },
      ),
    );
  }
}
