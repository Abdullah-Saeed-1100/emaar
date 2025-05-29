import 'package:emaar/features/estate/widgets/custom_header_home.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_text_styles.dart';

class HeaderSpecialProperty extends StatelessWidget {
  const HeaderSpecialProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomHeaderHome(
        title: 'العقارات المميزة',
        trailing: Text(
          'عرض الكل',
          // style: TextStyle(
          //   fontSize: 14,
          //   color: Color(0xFF1976D2),
          //   fontWeight: FontWeight.w600,
          // ),
          style: AppTextStyles.body14.copyWith(color: Colors.grey[900]),
        ),
      ),
    );
  }
}
