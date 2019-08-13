import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryTitle;
  // final String categoryId;
  // CategoryMealsScreen({this.categoryId, this.categoryTitle});
  static const routeName = '/categories-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          '$categoryTitle Recipes for the Categories!',
        ),
      ),
    );
  }
}
