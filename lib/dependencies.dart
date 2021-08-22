// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_recipe_app/domain/recipe/i_recipe_repository.dart';
import 'package:scratch_recipe_app/infrastructure/recipe/recipe_local_repository.dart';


List<RepositoryProvider> buildRepositories() {
  return [
    // RepositoryProvider<SecureStorageRepository>(
    //   create: (context) => SecureStorageRepository(
    //     FlutterSecureStorage(),
    //   ),
    // ),
    // RepositoryProvider<FacebookLogin>(create: (context) => FacebookLogin()),
    RepositoryProvider<IRecipeRepository>(create: (context) => RecipeLocalRepository()),
  ];
}
