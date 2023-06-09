import 'package:e_commerce/theming/theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryNameWidget extends StatelessWidget {
  String name;
  bool isSelected;
  CategoryNameWidget({required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        width: 120,
        height: 55,
        decoration: BoxDecoration(
            color:
                isSelected ? MyTheme.mainColor : Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          "${name}  ",
          style: Theme.of(context).textTheme.headline6?.copyWith(
              color: isSelected
                  ? Colors.white
                  : Theme.of(context).textTheme.headline6?.color,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ));
  }
}
