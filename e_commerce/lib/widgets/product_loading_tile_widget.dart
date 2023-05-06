import 'package:flutter/material.dart';

class ProductLoadingTileWidget extends StatelessWidget {
  const ProductLoadingTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            width: 220,
            height: 250,
            decoration: BoxDecoration(
                color: Colors.grey.withAlpha(80),
                borderRadius: BorderRadius.circular(15)),
          );
        },
      ),
    );
  }
}
