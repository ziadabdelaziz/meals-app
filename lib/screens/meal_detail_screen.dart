import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  // const MealDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/meal-detail';

  Widget titleBuilder(BuildContext context, title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Text(
        style: Theme.of(context).textTheme.titleLarge,
        '$title',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget Child) {
    return Container(
      width: 250,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      child: Child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere(
      (element) {
        return mealId == element.id;
      },
    );
    // final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(mealDetails.title)),
      body: Column(children: [
        Image.network(
          mealDetails.imageUrl,
          // fit: BoxFit.cover,
        ),
        titleBuilder(context, 'Ingredients'),
        buildContainer(
          context,
          ListView(
            children: mealDetails.ingredients.map((e) {
              return Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Text(
                  e as String,
                  textAlign: TextAlign.center,
                ),
              );
            }).toList(),
          ),
        ),
        titleBuilder(context, "Steps"),
        buildContainer(
          context,
          ListView.builder(
            itemCount: mealDetails.steps.length,
            itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(child: Text('# ${index + 1}')),
              title: Text(
                mealDetails.steps[index],
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
