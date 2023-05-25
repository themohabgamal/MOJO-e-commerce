import 'package:e_commerce/business_logic/cart/bloc/cart_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/cart_single_product_args.dart';
import 'package:e_commerce/widgets/cart_single_product_page.dart';
import 'package:e_commerce/widgets/cart_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  static const String routeName = 'cart';
  static List<CategoryResponseModel> cartList = [];

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartBloc cartBloc = CartBloc();
  num totalCost = 0;
  num subTotal = 0;
  num itemTotal = 0;
  num delivery = 0;
  List<num> totalItems = [];

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    if (CartScreen.cartList.isNotEmpty) {
      cartBloc.add(CartLoadEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        buildWhen: (previous, current) => current is! CartActionState,
        listenWhen: (previous, current) => current is CartActionState,
        listener: (context, state) {
          if (state is GoToCartSingleProductState) {
            Navigator.pushNamed(context, CartSingleProductPage.routeName,
                arguments: CartToSingleProductPageArgs(
                    cartBloc: cartBloc,
                    categoryResponseModel: state.categoryResponseModel));
          } else if (state is GetNewSubTotalState) {
            for (var item in CartScreen.cartList) {
              itemTotal = item.price! * state.quantity;
              print(itemTotal);
            }
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartInitial:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 250,
                        child: Image.asset("assets/images/box.png")),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "Looks like your cart is empty, \n please add items to show here",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  ],
                ),
              );
            case CartSuccessState:
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
                            onPressed: (context) {},
                          ),
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                          child: CartTileWidget(
                            categoryResponseModel: CartScreen.cartList[index],
                            cartBloc: cartBloc,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: CartScreen.cartList.length,
              ));
            default:
              return SizedBox();
          }
        },
      ),
      bottomNavigationBar: Container(
        height: 240,
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).textTheme.headline6?.color),
                  ),
                  Text("\$ ${subTotal}",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).textTheme.headline6?.color,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).textTheme.headline6?.color),
                  ),
                  Text("\$ ${delivery}",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).textTheme.headline6?.color,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Text("---------------------------------------",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).textTheme.headline6?.color,
                      fontSize: 20,
                      fontWeight: FontWeight.w100)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TotalCost",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).textTheme.headline6?.color,
                        fontWeight: FontWeight.w600),
                  ),
                  Text("\$ ${totalCost}",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Theme.of(context).textTheme.headline6?.color,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: MyTheme.mainColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("checkout",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600)),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
