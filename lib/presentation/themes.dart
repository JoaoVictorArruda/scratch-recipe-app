import 'package:flutter/material.dart';

const primaryColor = Color(0xFF30BE76);
const buttonColor = Color(0xFF4CC789);

class Themes {

  static ThemeData getTheme() {
      return themeLight;
    }

  static final ThemeData themeLight = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    backgroundColor: Colors.white,
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
        brightness: Brightness.dark,
        color: Colors.white,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        centerTitle: true
    ),
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'SFNS',
      decoration: TextDecoration.none,
      displayColor: Colors.black
    ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'SFNS',
      decoration: TextDecoration.none,
      displayColor: Colors.black
    ),
    accentTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'SFNS',
      decoration: TextDecoration.none,
      displayColor: Colors.black
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ))
        )
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
    ),
  );
}
