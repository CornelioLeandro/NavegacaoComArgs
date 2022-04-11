import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    Widget createTitleContainer(String title) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    Widget createSectionIngredients(Widget child) {
      return Container(
        width: double.infinity,
        height: 250,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.black12)),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          createTitleContainer('Ingredientes'),
          createSectionIngredients(
            ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                );
              },
            ),
          ),
          createTitleContainer('Passos'),
          createSectionIngredients(
            ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(
                    meal.steps[index],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
