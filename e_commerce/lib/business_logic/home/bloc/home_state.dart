part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {}

class HomeErrorState extends HomeState {}

class NavigateToCartState extends HomeActionState {}

class NavigateToSingleProductState extends HomeActionState {
  CategoryResponseModel categoryResponseModel;
  NavigateToSingleProductState({required this.categoryResponseModel});
}
