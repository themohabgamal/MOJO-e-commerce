import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/presentation/cart/cart_screen.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<NavigateBackEvent>(goBackEvent);
    on<GoToCartSingleProductEvent>(goToCartSingleProductEvent);
    on<GetNewSubTotalEvent>(getNewSubTotalEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartList: CartScreen.cartList));
  }

  FutureOr<void> goBackEvent(NavigateBackEvent event, Emitter<CartState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> goToCartSingleProductEvent(
      GoToCartSingleProductEvent event, Emitter<CartState> emit) {
    emit(GoToCartSingleProductState(
        categoryResponseModel: event.categoryResponseModel));
  }

  FutureOr<void> getNewSubTotalEvent(
      GetNewSubTotalEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartList: CartScreen.cartList));
    emit(GetNewSubTotalState(quantity: event.quantity));
  }
}
