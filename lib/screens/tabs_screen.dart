import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
final List<Meal> favoriteMeals;

TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
    late List<Widget> _pages;

  @override
  void initState() {
    _pages = [
    CategoriesScreen(),
    FavoritesScreen(widget.favoriteMeals),
  ];
    super.initState();
  }

  String title = 'Categories';

  int _sellectedPageIndex = 0;

  void _sellectPage(int index) {
    setState(() {
      _sellectedPageIndex = index;
      if (_sellectedPageIndex == 0) {
        title = 'Categories';
      } else if (_sellectedPageIndex == 1) {
        title = 'Your Favorite';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(),
      body: _pages[_sellectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _sellectPage(index);
          HapticFeedback.heavyImpact();
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Color.fromARGB(215, 255, 255, 255),
        fixedColor: Colors.white,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        iconSize: 29,
        enableFeedback: true,
        currentIndex: _sellectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline_outlined),
            activeIcon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
