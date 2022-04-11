import 'package:flutter/material.dart';
import '../screen/categories_meals_screen.dart';
import '../screen/meal_detail_screen.dart';
import '../screen/settings_screen.dart';
import '../screen/tabsbotton_screen.dart';
import 'util/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.pink,
          ).copyWith(secondary: Colors.amberAccent.shade100,),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'Robot',
              ))),
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (ctx) => TabsBottonScreen(),
        AppRoutes.CATEGORIESMEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetail(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesMealsScreen());
      },
    );
  }
}
