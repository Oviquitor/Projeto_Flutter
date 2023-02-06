import 'package:flutter/material.dart';

const brightness = Brightness.light;

ThemeData appTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: "Inter",
      ),
      bodyText2: TextStyle(
        fontFamily: "Inter",
      ),
      button: TextStyle(
        fontFamily: "Inter",
      ),
      caption: TextStyle(
        fontFamily: "Inter",
      ),
      headline1: TextStyle(
        fontFamily: "Inter",
      ),
      headline2: TextStyle(
        fontFamily: "Inter",
      ),
      headline3: TextStyle(
        fontFamily: "Inter",
      ),
      headline4: TextStyle(
        fontFamily: "Inter",
      ),
      headline5: TextStyle(
        fontFamily: "Inter",
      ),
      headline6: TextStyle(
        fontFamily: "Inter",
      ),
      subtitle1: TextStyle(
        fontFamily: "Inter",
      ),
      subtitle2: TextStyle(
        fontFamily: "Inter",
      ),
    ),

    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(
      secondary: Colors.orange,
    ),

    scaffoldBackgroundColor: Colors.white,
    //splashColor: Colors.transparent, //tira a animação do botao
    //highlightColor: Colors.transparent,
  );
}
