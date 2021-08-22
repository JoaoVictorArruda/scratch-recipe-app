import 'package:scratch_recipe_app/domain/recipe/recipe.dart';

abstract class IRecipeRepository {
  Future<List<Recipe>> getRecipes();
}
