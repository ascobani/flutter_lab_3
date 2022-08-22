import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/error_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/categories_meals_screen.dart';
import './screens/setting_screen.dart';
import './models/meal.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten'] == true && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] == true && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegetarian'] == true && !meal.isVegetarian) {
        return false;
      }
      if (_filters['vegan'] == true && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        canvasColor: Color.fromARGB(255, 243, 240, 212),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              headlineSmall: TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              titleLarge: TextStyle(
                fontSize: 30,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontSize: 13,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              bodyMedium: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amberAccent,
        ),
      ),
      //  home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(_setFilters,_filters),
      },
      onUnknownRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (context) => ErrorScreen(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: Center(
        child: Text('NavigationTime'),
      ),
    );
  }
}
