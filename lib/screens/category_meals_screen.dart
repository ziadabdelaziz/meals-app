import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  List<Meal> abailableMeals;

  CategoryMealsScreen(this.abailableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // const CategoryMealsScreen({Key? key}) : super(key: key);
  String categoryTitle = 'title';
  List<Meal> displayedMeals = [];
  bool _loadedInitData = false;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final id = routeArgs['id'];

      displayedMeals = widget.abailableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
    }
    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: MealItem(
                displayedMeals[index].id,
                displayedMeals[index].title,
                displayedMeals[index].imageUrl,
                displayedMeals[index].complexity,
                displayedMeals[index].duration,
                displayedMeals[index].affordability,
              ),
            );
          },
          itemCount: displayedMeals.length),
    );
  }
}
