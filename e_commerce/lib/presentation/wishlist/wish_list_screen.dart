// ignore_for_file: must_be_immutable

import 'package:e_commerce/business_logic/wishlist/bloc/wishlist_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/presentation/cart/cart_screen.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/cart_single_product_args.dart';
import 'package:e_commerce/widgets/cart_single_product_page.dart';
import 'package:e_commerce/widgets/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});
  static const String routeName = 'wishlist';
  static List<CategoryResponseModel> wishListList = [];
  WishlistBloc wishlistBloc = WishlistBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Wishlist"),
          leading: IconButton(
            icon: Icon(IconlyLight.arrow_left_2,
                color: Theme.of(context).textTheme.headline6?.color),
            onPressed: () {
              wishlistBloc.add(WishlistNavigateBackEvent());
            },
          ),
        ),
        body: BlocConsumer<WishlistBloc, WishlistState>(
          bloc: wishlistBloc,
          listenWhen: (previous, current) => current is WishlistActionState,
          buildWhen: (previous, current) => current is! WishlistActionState,
          listener: (context, state) {
            if (state is WishlistNavigateBackState) {
              Navigator.pop(context);
            } else if (state is WishlistNavigateToSingleProductState) {
              Navigator.pushNamed(context, CartSingleProductPage.routeName,
                  arguments: CartToSingleProductPageArgs(
                      categoryResponseModel: state.categoryResponseModel,
                      wishlistBloc: wishlistBloc));
            } else if (state is WishlistAddToCartState) {
              Navigator.pushNamed(
                context,
                CartScreen.routeName,
              );
            }
          },
          builder: (context, state) {
            if (wishListList.isNotEmpty) {
              return SizedBox(
                  child: ListView.separated(
                padding: EdgeInsets.all(10),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) {
                  return Slidable(
                    closeOnScroll: true,
                    endActionPane: ActionPane(
                        extentRatio: .2,
                        motion: BehindMotion(),
                        children: [
                          SlidableAction(
                            borderRadius: BorderRadius.circular(15),
                            icon: IconlyLight.delete,
                            backgroundColor: MyTheme.orangeColor,
                            onPressed: (context) {
                              wishlistBloc.add(WishlistRemoveItemEvent(
                                  categoryResponseModel:
                                      WishListScreen.wishListList[index]));
                            },
                          ),
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          child: WishlistTileWidget(
                            categoryResponseModel:
                                WishListScreen.wishListList[index],
                            wishlistBloc: wishlistBloc,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: WishListScreen.wishListList.length,
              ));
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/box.png",
                      width: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Looks like your wishlist is empty, \n please add items to show here",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
    // default:
    //   return SizedBox();
  }
}
