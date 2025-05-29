import 'package:emaar/features/estate/presentation/cubits/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/repos/estate_repo/estate_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final EstateRepo estateRepo;
  HomeCubit({required this.estateRepo}) : super(HomeInitialState());

  Future<void> fetchProperties() async {
    emit(HomeLoadingState());

    final result = await estateRepo.getAllEstates(tableName: 'properties');
    result.fold(
      (failure) {
        emit(HomeErrorState(errMessage: failure.message));
      },
      (properties) {
        emit(HomeSuccessState(properties: properties));
      },
    );
  }
}
