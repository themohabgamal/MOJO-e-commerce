import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/presentation/cart/cart_screen.dart';
import 'package:e_commerce/presentation/wishlist/wish_list_screen.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistRemoveItemEvent>(wishlistRemoveItemEvent);
    on<WishlistLoadEvent>(wishlistLoadEvent);
    on<WishlistNavigateBackEvent>(wishlistNavigateBackEvent);
    on<WishlistNavigateToSingleProductEvent>(
        wishlistNavigateToSingleProductEvent);
    on<WishlistAddToCartEvent>(wishlistAddToCartEvent);
  }

  FutureOr<void> wishlistRemoveItemEvent(
      WishlistRemoveItemEvent event, Emitter<WishlistState> emit) {
    WishListScreen.wishListList.remove(event.categoryResponseModel);
    emit(WishlistLoadState(list: WishListScreen.wishListList));
  }

  FutureOr<void> wishlistLoadEvent(
      WishlistLoadEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadState(list: WishListScreen.wishListList));
  }

  FutureOr<void> wishlistNavigateBackEvent(
      WishlistNavigateBackEvent event, Emitter<WishlistState> emit) {
    emit(WishlistNavigateBackState());
  }

  FutureOr<void> wishlistNavigateToSingleProductEvent(
      WishlistNavigateToSingleProductEvent event, Emitter<WishlistState> emit) {
    emit(WishlistNavigateToSingleProductState(
        categoryResponseModel: event.categoryResponseModel));
  }

  FutureOr<void> wishlistAddToCartEvent(
      WishlistAddToCartEvent event, Emitter<WishlistState> emit) {
    CartScreen.cartList.add(event.categoryResponseModel);
    emit(WishlistAddToCartState());
  }
}
