import 'package:e_commerce/models/category_response_model.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  static const String routeName = 'wishlist';
  static List<CategoryResponseModel> wishListList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Wishlist")),
    );
  }
}
