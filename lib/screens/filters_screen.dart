import 'package:flutter/material.dart';
import 'package:meals/widgets/my_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      drawer: const Drawer(child: MyDrawer()),
      body: const Center(
        child: Text("Filters Screen!"),
      ),
    );
  }
}
