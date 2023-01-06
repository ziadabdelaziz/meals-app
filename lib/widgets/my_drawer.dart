import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  Widget tilebuilder(String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      onTap: () => Navigator.of(context).pushReplacementNamed(route)
    );
  }

    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: double.infinity,
            height: 120,
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 15),
          tilebuilder('Meals', Icons.restaurant_outlined, '/'),
          tilebuilder('Filters', Icons.settings, FiltersScreen.routeName),
        ],
      ),
    );
  }
}
