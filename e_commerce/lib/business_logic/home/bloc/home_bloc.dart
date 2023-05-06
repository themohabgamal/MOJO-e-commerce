import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/repositories/home_category_repo.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateToCartEvent>(navigateToCartEvent);
    on<NavigateToSingleProductEvent>(navigateToSingleProductEvent);
    on<NavigateToHotDealsEvent>(navigateToHotDealsEvent);
    on<GoBackEvent>(goBackEvent);
    on<HotDealsLoadedEvent>(hotDealsLoadedEvent);
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

  FutureOr<void> navigateToHotDealsEvent(
      NavigateToHotDealsEvent event, Emitter<HomeState> emit) {
    emit(NavigateToHotDealsState());
  }

  FutureOr<void> goBackEvent(GoBackEvent event, Emitter<HomeState> emit) {
    emit(GoBackState());
  }

  FutureOr<void> hotDealsLoadedEvent(
      HotDealsLoadedEvent event, Emitter<HomeState> emit) async {
    emit(HotDealsLoadingState());
    var response = await HomeCategoryRepo.getAllProcuts();
    emit(HotDealsLoadedState(list: response!));
  }
}
