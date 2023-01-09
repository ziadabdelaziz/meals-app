import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'screens/filters_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({super.key});

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritMeals = [];

  Map<String, bool> _filters = {
    'gluten-free': false,
    'lactose-free': false,
    'vegan': false,
    'vegetarian': false,
  };

  void updateFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten-free']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose-free']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();

      Fluttertoast.showToast(
        msg: "Filters Saved",
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
      );
    });
  }

  void _toggleFavorite(String mealId) {
    final exestingMeal = _favoritMeals.indexWhere((meal) => meal.id == mealId);

    if (exestingMeal >= 0) {
      setState(() {
        _favoritMeals.removeAt(exestingMeal);
      });
    } else {
      setState(() {
        _favoritMeals.add(_availableMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorit(String mealId) {
    return _favoritMeals.any((meal) => meal.id == mealId);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
              // fontFamily: 'RobotoCondensed',
            ),
            headline6: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w500,
            ),
            headline5: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            )),
      ),

      home: TabScreen(_favoritMeals),
      // initialRoute: '/',
      routes: {
        // '/': (ctx) => TabScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorit),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(updateFilters, _filters),
      },
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      }),
    );
  }
}
























// class MyHomePage extends StatefulWidget {
//   // const MyHomePage({super.key, required this.title});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('DeliMeals'),
//         ),
//         body: const Center(
//           child: Text('Navigation Time!'),
//         ));
//   }
// }
