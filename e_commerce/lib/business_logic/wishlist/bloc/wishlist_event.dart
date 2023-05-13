part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistLoadEvent extends WishlistEvent {}

class WishlistRemoveItemEvent extends WishlistEvent {
  CategoryResponseModel categoryResponseModel;
  WishlistRemoveItemEvent({required this.categoryResponseModel});
}

class WishlistNavigateBackEvent extends WishlistEvent {}

class WishlistNavigateToSingleProductEvent extends WishlistEvent {
  CategoryResponseModel categoryResponseModel;
  WishlistNavigateToSingleProductEvent({required this.categoryResponseModel});
}
