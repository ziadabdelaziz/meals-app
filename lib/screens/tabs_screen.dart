import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorits_screen.dart';
import '../widgets/my_drawer.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'Your Favorite'}
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        fixedColor: Colors.amber,
        showUnselectedLabels: false,
        // selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
