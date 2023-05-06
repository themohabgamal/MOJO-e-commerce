// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:e_commerce/presentation/cart/cart_screen.dart';
import 'package:e_commerce/widgets/category_name_widget.dart';
import 'package:e_commerce/widgets/customized_api_home_widget.dart';
import 'package:e_commerce/widgets/filter_widget.dart';
import 'package:e_commerce/widgets/home_single_product_args.dart';
import 'package:e_commerce/widgets/search_bar_widget.dart';
import 'package:e_commerce/widgets/single_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          Navigator.pushNamed(context, CartScreen.routeName);
        } else if (state is NavigateToSingleProductState) {
          Navigator.pushNamed(context, SingleProductPage.routeName,
              arguments: HomeToSingleProductArgs(
                  categoryResponseModel: state.categoryResponseModel,
                  homeBloc: homeBloc));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("MOJO"),
            centerTitle: true,
            leading: IconButton(
              icon: Image.asset("assets/images/menu.png", width: 30),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Image.asset(
                  "assets/images/bag.png",
                  width: 30,
                ),
                onPressed: () {
                  homeBloc.add(NavigateToCartEvent());
                },
              )
            ],
          ),
          //*-------------------------------------------------------------body------------------------------------------------
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Expanded(child: SearchBarWidget()), FilterWidget()],
              ),
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
                  separatorBuilder: (context, index) => SizedBox(width: 10),
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
                  height: 300,
                  child: CustomizedApiHomeWidget(
                      homeBloc: homeBloc, category: category))
            ]),
          ),
        );
      },
    );
  }
}
