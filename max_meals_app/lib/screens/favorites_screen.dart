import 'package:flutter/material.dart';
import 'package:max_meals_app/models/meal.dart';
import 'package:max_meals_app/widgets/meal_item.dart';

class FovoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FovoritesScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text('You have no fovorite yet - start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            imgUrl: favoriteMeal[index].imageUrl,
            duration: favoriteMeal[index].duration,
            affordability: favoriteMeal[index].affordability,
            complexity: favoriteMeal[index].complexity,
            //removeItem: _removeMeal,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
