import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  // const Favorits({Key? key}) : super(key: key);

  final favoritMeals;

  FavoritesScreen(this.favoritMeals);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: favoritMeals.isEmpty
          ? const Center(child: Text('No Favorits Yet!'))
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: MealItem(
                    favoritMeals[index].id,
                    favoritMeals[index].title,
                    favoritMeals[index].imageUrl,
                    favoritMeals[index].complexity,
                    favoritMeals[index].duration,
                    favoritMeals[index].affordability,
                  ),
                );
              },
              itemCount: favoritMeals.length),
    );
  }
}
