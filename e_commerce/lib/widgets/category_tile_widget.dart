// ignore_for_file: must_be_immutable

import 'package:e_commerce/business_logic/home/bloc/home_bloc.dart';
import 'package:e_commerce/models/category_response_model.dart';
import 'package:e_commerce/theming/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CategoryTileWidget extends StatelessWidget {
  CategoryResponseModel categoryResponseModel;
  HomeBloc homeBloc;
  CategoryTileWidget(
      {super.key, required this.categoryResponseModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeBloc.add(NavigateToSingleProductEvent(
            categoryResponseModel: categoryResponseModel));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: 220,
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            Expanded(
                child: Image.network(
              "${categoryResponseModel.image}",
              width: 150,
              fit: BoxFit.contain,
            )),
            SizedBox(height: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "BEST SELLER",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(fontSize: 15, color: MyTheme.mainColor),
                ),
                SizedBox(height: 10),
                Text(
                  "${categoryTitleBuilder(categoryResponseModel.title)}",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: MyTheme.darkGreyColor),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${categoryResponseModel.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(IconlyLight.heart)),
                        IconButton(
                            onPressed: () {}, icon: Icon(IconlyLight.bag)),
                      ],
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  String? categoryTitleBuilder(String? title) {
    if (title!.length > 20) {
      return title.substring(0, 20);
    } else
      return title;
  }
}
