import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('sdfad'),
      ),
    );
  }
}
