import 'dart:convert';

import 'package:scratch_recipe_app/domain/recipe/i_recipe_repository.dart';
import 'package:scratch_recipe_app/domain/recipe/recipe.dart';
import 'package:flutter/services.dart' show rootBundle;

class RecipeLocalRepository implements IRecipeRepository {

  @override
  Future<List<Recipe>> getRecipes() async {
    final String jsonString = await rootBundle.loadString('local_data/recipe.json');
    final response = json.decode(jsonString);
    return Recipe.fromJsonList(response['data']['recipe']);
  }

}