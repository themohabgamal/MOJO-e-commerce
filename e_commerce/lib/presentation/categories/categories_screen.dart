import 'package:e_commerce/business_logic/categories/bloc/categories_bloc.dart';
import 'package:e_commerce/business_logic/home/bloc/home_bloc.dart';
import 'package:e_commerce/repositories/home_category_repo.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:e_commerce/widgets/categories_single_product_args.dart';
import 'package:e_commerce/widgets/categories_single_product_page.dart';
import 'package:e_commerce/widgets/category_tile_widget.dart';
import 'package:e_commerce/widgets/filter_widget.dart';
import 'package:e_commerce/widgets/product_loading_tile_widget.dart';
import 'package:e_commerce/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoriesBloc categoriesBloc = CategoriesBloc();
  String selectedCategory = 'electronics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.mainColor,
        title: Text(
          "Browse Our Categories",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white, fontSize: 25),
        ),
      ),
      body: BlocConsumer<CategoriesBloc, CategoriesState>(
        bloc: categoriesBloc,
        listenWhen: (previous, current) => current is CategoriesActionState,
        buildWhen: (previous, current) => current is! CategoriesActionState,
        listener: (context, state) {
          if (state is CategoriesNavigateToSingleProductState) {
            Navigator.pushNamed(context, CategoriesSingleProductPage.routeName,
                arguments: CategoriesToSingleProductArgs(
                    categoriesBloc: categoriesBloc,
                    categoryResponseModel: state.categoryResponseModel));
          }
          if (state is CategoriesNavigateBackState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SafeArea(
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: MyTheme.mainColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: SearchBarWidget()),
                      PopupMenuButton(
                        color: MyTheme.darkGreyColor,
                        onSelected: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            IconlyBold.filter,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                                child: Text(
                                  "Electronics",
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: "electronics"),
                            PopupMenuItem(
                                child: Text(
                                  "Jewelery",
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: "jewelery"),
                            PopupMenuItem(
                                child: Text(
                                  "Men's clothing",
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: "men's clothing"),
                            PopupMenuItem(
                                child: Text(
                                  "Women's clothing",
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: "women's clothing"),
                          ];
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 44,
              ),
              Container(
                height: 500,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 244, 244, 244),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: FutureBuilder(
                    future: HomeCategoryRepo.getSpeceficCategory(
                        "${selectedCategory}"),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                "Error fetching data from server ${snapshot.error.toString()}"));
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 6 / 10,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return ProductLoadingTileWidget();
                          },
                          itemCount: snapshot.data?.length,
                        );
                      } else if (snapshot.hasData) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 6 / 10,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15),
                          itemBuilder: (context, index) {
                            return CategoryTileWidget(
                              categoryResponseModel: snapshot.data![index],
                              categoriesBloc: categoriesBloc,
                              isHotDeal: false,
                            );
                          },
                          itemCount: snapshot.data!.length,
                        );
                      } else
                        return SizedBox();
                    },
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
