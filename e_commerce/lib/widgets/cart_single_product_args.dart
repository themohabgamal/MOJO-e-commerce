import 'package:e_commerce/business_logic/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/business_logic/wishlist/bloc/wishlist_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';

class CartToSingleProductPageArgs {
  CartBloc? cartBloc;
  WishlistBloc? wishlistBloc;
  CategoryResponseModel categoryResponseModel;
  CartToSingleProductPageArgs(
      {this.cartBloc, this.wishlistBloc, required this.categoryResponseModel});
}
