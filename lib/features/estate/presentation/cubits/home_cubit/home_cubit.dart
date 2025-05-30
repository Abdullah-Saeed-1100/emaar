import 'package:emaar/features/estate/presentation/cubits/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/property_entity.dart';
import '../../../../../core/repos/estate_repo/estate_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final EstateRepo estateRepo;
  HomeCubit({required this.estateRepo}) : super(HomeInitialState());

  List<PropertyEntity> featuredProperties = [];
  List<PropertyEntity> allProperties = [];

  Future<void> fetchProperties() async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    final result = await estateRepo.getAllEstates(tableName: 'properties');
    result.fold(
      (failure) {
        emit(HomeErrorState(errMessage: failure.message));
      },
      (properties) {
        featuredProperties =
            properties.where((property) => property.isFeatured).toList();
        allProperties = properties;
        emit(
          HomeSuccessState(
            properties: properties.take(3).toList(), // Take first 3 properties
            // properties: properties,
            propertiesFeatured: featuredProperties,
          ),
        );
      },
    );
  }
}
