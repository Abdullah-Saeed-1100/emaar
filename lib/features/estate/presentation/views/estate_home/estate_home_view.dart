import 'package:emaar/core/services/get_it_service.dart';
import 'package:emaar/features/estate/presentation/views/estate_home/widgets/estate_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/repos/estate_repo/estate_repo.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../cubits/home_cubit/home_cubit.dart';

class EstateHomeView extends StatelessWidget {
  const EstateHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              HomeCubit(estateRepo: getIt.get<EstateRepo>())..fetchProperties(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: EstateHomeViewBody(),
      ),
    );
  }
}
