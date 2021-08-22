import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_recipe_app/domain/recipe/i_recipe_repository.dart';
import 'package:scratch_recipe_app/domain/recipe/recipe.dart';

class RecipeOverviewState {

  final bool isLoading;
  final List<Recipe> recipes;

  RecipeOverviewState({required this.isLoading, required this.recipes});

  factory RecipeOverviewState.initial() {
    return RecipeOverviewState(
      isLoading: true,
      recipes: [],
    );
  }

  RecipeOverviewState copyWith({
    bool? isLoading,
    List<Recipe>? recipes,
  }) {
    return RecipeOverviewState(
      isLoading: isLoading ?? this.isLoading,
      recipes: recipes ?? this.recipes,
    );
  }

}

class RecipeOverviewCubit extends Cubit<RecipeOverviewState> {

  RecipeOverviewCubit(this.recipeRepository) : super(RecipeOverviewState.initial());

  final IRecipeRepository recipeRepository;

  void initial() async {
    List<Recipe> recipes = await recipeRepository.getRecipes();
    emit(state.copyWith(recipes: recipes, isLoading: false));
  }

}