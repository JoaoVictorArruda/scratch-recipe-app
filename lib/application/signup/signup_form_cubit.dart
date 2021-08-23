import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:scratch_recipe_app/domain/profile/profile.dart';

class SignupFormState {


}


class SignupFormCubit extends Cubit<SignupFormState> {

  SignupFormCubit(this.facebookAuth) : super(SignupFormState());

  final FacebookAuth facebookAuth;

  void initial() {
    Profile.isFacebook = false;
  }

  String login(String email, String password) {
    if(email == 'admin@scratch.com' && password == 'admin') {
      Profile.isFacebook = false;
      return "";
    }
    return "Invalid credentials";
  }

  Future<String> loginWithFacebook() async {
    final result = await facebookAuth.login();
    if (result.status == LoginStatus.success) {
      final _userData = await facebookAuth.getUserData();
      Profile.isFacebook = true;
      Profile.imageFacebook = _userData['picture']['data']['url'];
      Profile.nameFacebook = _userData['name'];
      return "";
    }
    return result.message.toString();
  }

}