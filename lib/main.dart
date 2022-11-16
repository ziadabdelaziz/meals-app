import 'package:flutter/material.dart';
import 'package:meals/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          // bodyText1: TextStyle(
          //   color: Color.fromRG
          // )
        )
      ),
      home: CategoriesScreen(),
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
