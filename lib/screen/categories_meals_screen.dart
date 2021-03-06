import 'package:flutter/material.dart';
import 'package:navegacao/components/meals_item.dart';
import 'package:navegacao/data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
            itemBuilder: (ctx, index){
              return MealItem(categoryMeals[index]);
            })
      ),
    );
  }
}
