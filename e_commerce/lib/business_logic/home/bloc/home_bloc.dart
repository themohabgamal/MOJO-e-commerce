import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateToCartEvent>(navigateToCartEvent);
    on<NavigateToSingleProductEvent>(navigateToSingleProductEvent);
  }

  FutureOr<void> navigateToCartEvent(
      NavigateToCartEvent event, Emitter<HomeState> emit) {
    emit(NavigateToCartState());
  }

  FutureOr<void> navigateToSingleProductEvent(
      NavigateToSingleProductEvent event, Emitter<HomeState> emit) {
    emit(NavigateToSingleProductState(
        categoryResponseModel: event.categoryResponseModel));
  }
}
