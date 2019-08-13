enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meals {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutonFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  Meals({
    this.id,
    this.categories,
    this.title,
    this.imageUrl,
    this.ingredients,
    this.steps,
    this.duration,
    this.complexity,
    this.affordability,
    this.isGlutonFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,
  });
}
