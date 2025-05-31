import 'package:emaar/features/estate/presentation/views/estate_home/widgets/custom_header_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_text_styles.dart';
import '../../../cubits/home_cubit/home_cubit.dart';
import '../../all_or_featured_estate/all_or_featured_estate_view.dart';

class HeaderAllProperty extends StatelessWidget {
  const HeaderAllProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final properties = context.watch<HomeCubit>().allProperties;

    return SliverToBoxAdapter(
      child: CustomHeaderHome(
        title: 'جميع العقارات',
        trailing: GestureDetector(
          onTap:
              properties.isEmpty
                  ? null
                  : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (context) => AllOrFeaturedEstateView(
                              isFeatured: false,
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
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Icon(Icons.tune, size: 16, color: Colors.grey[600]),
            //     SizedBox(width: 4),
            //     Text(
            //       'فلترة',
            //       style: TextStyle(color: Colors.grey[600], fontSize: 14),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
