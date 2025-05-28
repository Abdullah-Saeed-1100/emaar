import 'package:emaar/features/estate/widgets/estate_home_view_body.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class EstateHomeView extends StatelessWidget {
  const EstateHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: EstateHomeViewBody(),
    );
  }
}
