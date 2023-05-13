// ignore_for_file: must_be_immutable
import 'package:e_commerce/business_logic/wishlist/bloc/wishlist_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:flutter/material.dart';

class WishlistTileWidget extends StatefulWidget {
  CategoryResponseModel categoryResponseModel;
  WishlistBloc wishlistBloc;

  WishlistTileWidget(
      {super.key,
      required this.categoryResponseModel,
      required this.wishlistBloc});

  @override
  State<WishlistTileWidget> createState() => _WishlistTileWidget();
}

class _WishlistTileWidget extends State<WishlistTileWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.wishlistBloc.add(WishlistNavigateToSingleProductEvent(
            categoryResponseModel: widget.categoryResponseModel));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 220,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Row(
          children: [
            Image.network(
              "${widget.categoryResponseModel.image}",
              width: 80,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),
                Container(
                  child: Text(
                    "${categoryTitleBuilder(widget.categoryResponseModel.title)}",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.categoryResponseModel.price.toString().length > 3 ? widget.categoryResponseModel.price.toString().substring(0, 3) : widget.categoryResponseModel.price.toString()}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: MyTheme.mainColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  String? categoryTitleBuilder(String? title) {
    if (title!.length > 30) {
      return title.substring(0, 30);
    } else
      return title;
  }
}
