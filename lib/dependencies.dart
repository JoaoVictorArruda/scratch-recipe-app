import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:scratch_recipe_app/domain/profile/i_profile_repository.dart';
import 'package:scratch_recipe_app/domain/recipe/i_recipe_repository.dart';
import 'package:scratch_recipe_app/infrastructure/profile/profile_local_repository.dart';
import 'package:scratch_recipe_app/infrastructure/recipe/recipe_local_repository.dart';


List<RepositoryProvider> buildRepositories() {
  return [
    RepositoryProvider<FacebookAuth>(create: (context) => FacebookAuth.instance),
    RepositoryProvider<IRecipeRepository>(create: (context) => RecipeLocalRepository()),
    RepositoryProvider<IProfileRepository>(create: (context) => ProfileLocalRepository()),
  ];
}
