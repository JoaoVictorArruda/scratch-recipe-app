import 'package:scratch_recipe_app/domain/profile/profile.dart';

abstract class IProfileRepository {
  Future<Profile> getProfile();
}
