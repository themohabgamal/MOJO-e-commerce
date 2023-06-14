import 'package:e_commerce/business_logic/home/bloc/home_bloc.dart';
import 'package:e_commerce/business_logic/theming/cubit/theming_cubit.dart';
import 'package:e_commerce/presentation/cart/cart_screen.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/home_single_product_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:readmore/readmore.dart';

class SingleProductPage extends StatelessWidget {
  static const String routeName = 'singleProdPage';
  SingleProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as HomeToSingleProductArgs;
    ThemingCubit themingCubit =
        BlocProvider.of<ThemingCubit>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left_2,
              color: Theme.of(context).textTheme.headline5?.color),
          onPressed: () {
            args.homeBloc.add(GoBackEvent());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "${args.categoryResponseModel?.title}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                "${args.categoryResponseModel?.category}",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Image.network(
                "${args.categoryResponseModel?.image}",
                width: double.infinity,
                height: 300,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 10),
              Text(
                "\$ ${args.categoryResponseModel?.price}",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    fontSize: 28,
                    color: MyTheme.mainColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              ReadMoreText(
                "${args.categoryResponseModel?.description}",
                style: Theme.of(context).textTheme.subtitle1,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.color
                          ?.withAlpha(20),
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconlyLight.heart,
                        size: 30,
                        color: Theme.of(context).textTheme.headline5?.color,
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    args.homeBloc.add(HomeAddToCartEvent(
                        categoryResponseModel: args.categoryResponseModel!));
                  },
                  child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                          color: MyTheme.mainColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyLight.bag,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text("Add to cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(color: Colors.white))
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
