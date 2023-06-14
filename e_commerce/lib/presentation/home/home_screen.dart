// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:e_commerce/presentation/auth/authenticated_screen.dart';
import 'package:e_commerce/presentation/auth/non_authenticated_screen.dart';
import 'package:e_commerce/presentation/cart/cart_screen.dart';
import 'package:e_commerce/presentation/home/hot_deals_page.dart';
import 'package:e_commerce/presentation/wishlist/wish_list_screen.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/category_name_widget.dart';
import 'package:e_commerce/widgets/customized_api_home_widget.dart';
import 'package:e_commerce/widgets/home_single_product_args.dart';
import 'package:e_commerce/widgets/single_product_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../business_logic/home/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc();
  List<String> categories = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];

  int current = 0;
  String category = "electronics";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is NavigateToCartState) {
          Navigator.pushNamed(context, CartScreen.routeName,
              arguments: homeBloc);
        } else if (state is NavigateToSingleProductState) {
          Navigator.pushNamed(context, SingleProductPage.routeName,
              arguments: HomeToSingleProductArgs(
                  categoryResponseModel: state.categoryResponseModel,
                  homeBloc: homeBloc));
        } else if (state is NavigateToHotDealsState) {
          Navigator.pushNamed(context, HotDealsPage.routeName,
              arguments: homeBloc);
          homeBloc.add(HotDealsLoadedEvent());
        } else if (state is NavigateToWishlistState) {
          Navigator.pushNamed(context, WishListScreen.routeName);
        } else if (state is GoBackState) {
          Navigator.pop(context);
        } else if (state is AddToCartState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Item was added to your cart",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            backgroundColor: MyTheme.mainColor,
            duration: Duration(seconds: 1),
          ));
        } else if (state is AddToWishlistState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Item was added to your wishlist",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            backgroundColor: MyTheme.mainColor,
            duration: Duration(seconds: 1),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AuthenticatedScreen();
              } else {
                return NonAuthenticatedScreen();
              }
            },
          ),
          appBar: AppBar(
            title: const Text(
              "MOJO",
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
            leading: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ));
              },
            ),
            actions: [
              IconButton(
                icon: Icon(IconlyLight.heart, size: 30),
                onPressed: () {
                  homeBloc.add(NavigateToWishlistEvent());
                },
              ),
            ],
          ),
          //*-------------------------------------------------------------body------------------------------------------------
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Select Category",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.separated(
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                                category = categories[index];
                              });
                            },
                            child: CategoryNameWidget(
                                name: categories[index],
                                isSelected: index == current ? true : false),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        itemCount: 4,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Popular",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.36,
                        child: CustomizedApiHomeWidget(
                            homeBloc: homeBloc, category: category)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hot Deals",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        TextButton(
                          onPressed: () {
                            homeBloc.add(NavigateToHotDealsEvent());
                          },
                          child: Text(
                            "View all",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: MyTheme.mainColor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/images/pattern.jpg",
                              height: 100,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Text(
                            "50% off",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 50,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Clothes",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: CustomizedApiHomeWidget(
                            homeBloc: homeBloc, category: "men's clothing")),
                    SizedBox(height: 20),
                  ]),
            ),
          ),
        );
      },
    );
  }
}
