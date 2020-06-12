import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  FavoritesScreen(this.favoritesMeals);
  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(meal: favoritesMeals[index], removeMeal: () {});
      },
      itemCount: favoritesMeals.length,
    );
  }
}
