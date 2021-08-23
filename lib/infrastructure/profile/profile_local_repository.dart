import 'dart:convert';

import 'package:scratch_recipe_app/domain/profile/i_profile_repository.dart';
import 'package:scratch_recipe_app/domain/profile/profile.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProfileLocalRepository implements IProfileRepository {

  @override
  Future<Profile> getProfile() async {
    final String jsonString = await rootBundle.loadString('local_data/profile.json');
    final response = json.decode(jsonString);
    return Profile.fromJson(response['data']['profile']);
  }

}