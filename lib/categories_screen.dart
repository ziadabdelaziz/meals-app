import 'package:flutter/material.dart';
import 'package:meals/category_item.dart';
import 'package:meals/dummy_data.dart';

import './dummy_data.dart';
import './models/category.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                catData.title,
                catData.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
