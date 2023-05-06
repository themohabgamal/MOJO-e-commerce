import 'package:e_commerce/business_logic/home/bloc/home_bloc.dart';
import 'package:e_commerce/widgets/category_tile_widget.dart';
import 'package:e_commerce/widgets/product_loading_tile_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class HotDealsPage extends StatefulWidget {
  const HotDealsPage({super.key});
  static const String routeName = 'hotdeals';

  @override
  State<HotDealsPage> createState() => _HotDealsPageState();
}

class _HotDealsPageState extends State<HotDealsPage> {
  @override
  Widget build(BuildContext context) {
    var homeBloc = ModalRoute.of(context)?.settings.arguments as HomeBloc;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(IconlyLight.arrow_left_2, color: Colors.black),
            onPressed: () {
              homeBloc.add(GoBackEvent());
            },
          ),
          centerTitle: true,
          title: Text("Hot Deals")),
      body: BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HotDealsLoadedState) {
            final successState = state as HotDealsLoadedState;
            return SizedBox(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 6 / 10,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                return CategoryTileWidget(
                  categoryResponseModel: successState.list[index],
                  homeBloc: homeBloc,
                  isHotDeal: true,
                );
              },
              itemCount: successState.list.length,
            ));
          } else if (state is HotDealsLoadingState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 6 / 10,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FancyShimmerImage(imageUrl: "imageUrl")),
                );
              },
            );
          } else
            return SizedBox();
        },
      ),
    );
  }
}
