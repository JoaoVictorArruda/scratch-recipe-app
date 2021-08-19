import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scratch_recipe_app/application/splash/splash_cubit.dart';
import 'package:scratch_recipe_app/navigator_utils.dart';
import 'package:scratch_recipe_app/presentation/signup/signup_form_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, snapshot) {
          pushAndReplaceToPage(context, SignupFormPage());
        },
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Hero(
                      tag: 'logo_hero',
                      child: Image.asset(
                        'assets/logo_splash.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
