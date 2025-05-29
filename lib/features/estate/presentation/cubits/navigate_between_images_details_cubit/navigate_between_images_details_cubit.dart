import 'package:flutter_bloc/flutter_bloc.dart';

class NavigateBetweenImagesDetailsCubit extends Cubit<int> {
  NavigateBetweenImagesDetailsCubit() : super(0);

  void navigateTo({required int index}) {
    emit(index);
  }
}
