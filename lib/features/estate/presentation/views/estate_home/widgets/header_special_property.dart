import 'package:emaar/features/estate/presentation/views/estate_home/widgets/custom_header_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_text_styles.dart';
import '../../../cubits/home_cubit/home_cubit.dart';
import '../../all_or_featured_estate/all_or_featured_estate_view.dart';

class HeaderSpecialProperty extends StatelessWidget {
  const HeaderSpecialProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final properties = context.watch<HomeCubit>().featuredProperties;
    return SliverToBoxAdapter(
      child: CustomHeaderHome(
        title: 'العقارات المميزة',
        trailing: GestureDetector(
          onTap:
              properties.isEmpty
                  ? null
                  : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => AllOrFeaturedEstateView(
                              isFeatured: true,
                              properties: properties,
                            ),
                      ),
                    );
                  },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(
              'عرض الكل',
              style: AppTextStyles.body14.copyWith(color: Colors.grey[900]),
            ),
          ),
        ),
      ),
    );
  }
}
