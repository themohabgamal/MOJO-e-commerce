import 'package:e_commerce/business_logic/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/cart_single_product_args.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:readmore/readmore.dart';

class CartSingleProductPage extends StatelessWidget {
  static const String routeName = 'cartSingleProdPage';
  CartSingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
        as CartToSingleProductPageArgs;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left_2, color: Colors.black),
          onPressed: () {
            args.cartBloc.add(NavigateBackEvent());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "${args.categoryResponseModel.title}",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  "${args.categoryResponseModel.category}",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 22,
                      color: MyTheme.darkGreyColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Image.network(
                  "${args.categoryResponseModel.image}",
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 10),
                Text(
                  "\$ ${args.categoryResponseModel.price}",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                ReadMoreText(
                  "${args.categoryResponseModel.description}",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: MyTheme.darkGreyColor),
                  trimLines: 4,
                  colorClickableText: MyTheme.mainColor,
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.mainColor),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.mainColor),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 1,
                ),
                Container(
                    width: 200,
                    height: 70,
                    decoration: BoxDecoration(
                        color: MyTheme.mainColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              IconlyLight.bag,
                              size: 30,
                              color: Colors.white,
                            )),
                        Text("Buy this item",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white))
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
