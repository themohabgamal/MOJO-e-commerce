import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesNavigateToSingleProductPageEvent>(
        categoriesNavigateToSingleProductPageEvent);
    on<CategoriesNavigateBackEvent>(categoriesNavigateBackEvent);
  }

  FutureOr<void> categoriesNavigateToSingleProductPageEvent(
      CategoriesNavigateToSingleProductPageEvent event,
      Emitter<CategoriesState> emit) {
    emit(CategoriesNavigateToSingleProductState(
        categoryResponseModel: event.categoryResponseModel));
  }

  FutureOr<void> categoriesNavigateBackEvent(
      CategoriesNavigateBackEvent event, Emitter<CategoriesState> emit) {
    emit(CategoriesNavigateBackState());
  }
}
