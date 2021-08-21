import 'package:flutter/material.dart';
import 'package:scratch_recipe_app/presentation/splash/splash_page.dart';
import 'package:scratch_recipe_app/presentation/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    // MultiRepositoryProvider(
      // providers: buildRepositories(),
      // child:
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scratch Recipe',
        theme: Themes.getTheme(),
        home: SplashPage(),
      )
    // )
    ;
  }
}