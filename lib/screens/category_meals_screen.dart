import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // const CategoryMealsScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routeArgs['id'], title = routeArgs['title'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: MealItem(
                categoryMeals[index].id,
                categoryMeals[index].title,
                categoryMeals[index].imageUrl,
                categoryMeals[index].complexity,
                categoryMeals[index].duration,
                categoryMeals[index].affordability,
              ),
            );
          },
          itemCount: categoryMeals.length),
    );
  }
}
