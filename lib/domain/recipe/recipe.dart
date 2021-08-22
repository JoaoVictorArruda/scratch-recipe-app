class Recipe {

  final String name;
  final String category;
  final String image;
  final int time;
  final List<Ingredient> ingredients;

  Recipe({required this.category, required this.image, required this.time, required this.ingredients, required this.name});

  static List<Recipe> fromJsonList(List<dynamic> jsonMap) {
    List<Recipe> items = [];
    for(int i = 0; i < jsonMap.length; i++) {
      items.add(Recipe.fromJson(jsonMap[i]));
    }
    return items;
  }

  factory Recipe.fromJson(Map<String, dynamic> jsonData) {
    return Recipe(
      name: jsonData['name'],
      category: jsonData['category'],
      image: jsonData['image'],
      time: jsonData['time'],
      ingredients: jsonData["ingredients"] is List ? Ingredient.fromJsonList(jsonData["ingredients"]) : [],
    );
  }

}

class Ingredient {

  final String name;

  Ingredient({required this.name});

  static List<Ingredient> fromJsonList(List<dynamic> jsonMap) {
    List<Ingredient> items = [];
    for(int i = 0; i < jsonMap.length; i++) {
      Ingredient item = Ingredient(
        name : jsonMap[i]["name"],
      );
      items.add(item);
    }
    return items;
  }

}