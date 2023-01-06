import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meals/widgets/category_item.dart';
import 'package:meals/dummy_data.dart';

import '../dummy_data.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    int cnt = 1;
    final mediaQuery = MediaQuery.of(context);
    if (mediaQuery.size.width <= 310) {
      cnt = 1;
    } else if (mediaQuery.size.width <= 450) {
      cnt = 2;
    } else {
      cnt = 3;
    }
    return Padding(
      padding: const EdgeInsets.all(14),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cnt,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.id,
                catData.title,
                catData.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
