import 'package:e_commerce/business_logic/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';

class CartToSingleProductPageArgs {
  CartBloc cartBloc;
  CategoryResponseModel categoryResponseModel;
  CartToSingleProductPageArgs(
      {required this.cartBloc, required this.categoryResponseModel});
}
