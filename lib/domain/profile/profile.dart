class Profile {

  final String name;
  final String description;
  final String image;
  final String followers;
  final String likes;
  final String following;
  final String saved;
  final List<Recipe> recipes;

  Profile({required this.name, required this.description, required this.image, required this.followers, required this.likes, required this.following, required this.saved, required this.recipes});

  factory Profile.fromJson(Map<String, dynamic> jsonData) {
    return Profile(
      name: jsonData['name'],
      description: jsonData['description'],
      image: jsonData['image'],
      followers: jsonData['followers'],
      likes: jsonData['likes'],
      following: jsonData['following'],
      saved: jsonData['saved'],
      recipes: jsonData["recipes"] is List ? Recipe.fromJsonList(jsonData["recipes"]) : [],
    );
  }

  factory Profile.empty() {
    return Profile(
      name: '',
      description: '',
      image: '',
      followers: '',
      likes: '',
      following: '',
      saved: '',
      recipes: []
    );
  }

}

class Recipe {

  final String name;
  final String image;

  Recipe({required this.name, required this.image});

  static List<Recipe> fromJsonList(List<dynamic> jsonMap) {
    List<Recipe> items = [];
    for(int i = 0; i < jsonMap.length; i++) {
      Recipe item = Recipe(
        name : jsonMap[i]["name"],
        image : jsonMap[i]["image"],
      );
      items.add(item);
    }
    return items;
  }

}