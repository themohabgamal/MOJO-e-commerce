part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class NavigateToCartEvent extends HomeEvent {}

class NavigateToSingleProductEvent extends HomeEvent {
  CategoryResponseModel categoryResponseModel;
  NavigateToSingleProductEvent({required this.categoryResponseModel});
}

class NavigateToHotDealsEvent extends HomeEvent {}

class GoBackEvent extends HomeEvent {}

class AddToCartEvent extends HomeEvent {}

class AddToWishlistEvent extends HomeEvent {}

class HotDealsLoadedEvent extends HomeEvent {}
