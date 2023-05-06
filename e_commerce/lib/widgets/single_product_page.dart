import 'package:e_commerce/business_logic/home/bloc/home_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/widgets/home_single_product_args.dart';
import 'package:flutter/material.dart';

class SingleProductPage extends StatelessWidget {
  static const String routeName = 'singleProdPage';

  // CategoryResponseModel? categoryResponseModel;
  // HomeBloc homeBloc = HomeBloc();
  SingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as HomeToSingleProductArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text("MOJO"),
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/images/bag.png",
              width: 30,
            ),
            onPressed: () {
              args.homeBloc.add(NavigateToCartEvent());
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "${args.categoryResponseModel?.title}",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
