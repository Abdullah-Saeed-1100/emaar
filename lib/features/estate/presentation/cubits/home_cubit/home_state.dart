import 'package:emaar/core/entities/property_entity.dart';
// part of 'sign_up_cubit.dart';

// @immutable
// sealed class SignUpState {}
abstract class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final List<PropertyEntity> properties;
  final List<PropertyEntity> propertiesFeatured;

  HomeSuccessState({
    required this.properties,
    required this.propertiesFeatured,
  });
}

final class HomeErrorState extends HomeState {
  final String errMessage;

  HomeErrorState({required this.errMessage});
}
