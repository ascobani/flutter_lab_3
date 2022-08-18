import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/error_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                fontSize: 10,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
          secondary: Colors.pinkAccent,
        ),
      ),
      //  home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
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
