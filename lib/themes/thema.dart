import 'package:flutter/material.dart';

const brightness = Brightness.light;

ThemeData appTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: "Poppins",
      ),
      bodyText2: TextStyle(
        fontFamily: "Poppins",
      ),
      button: TextStyle(
        fontFamily: "Poppins",
      ),
      caption: TextStyle(
        fontFamily: "Poppins",
      ),
      headline1: TextStyle(
        fontFamily: "Poppins",
      ),
      headline2: TextStyle(
        fontFamily: "Poppins",
      ),
      headline3: TextStyle(
        fontFamily: "Poppins",
      ),
      headline4: TextStyle(
        fontFamily: "Poppins",
      ),
      headline5: TextStyle(
        fontFamily: "Poppins",
      ),
      headline6: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle1: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle2: TextStyle(
        fontFamily: "Poppins",
      ),
    ),

    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.pink,
    ).copyWith(
      secondary: Color.fromARGB(255, 0, 0, 0),
    ),

    scaffoldBackgroundColor: Color.fromARGB(255, 255, 247, 247),
    splashColor: Colors.transparent, //tira a animação do botao
    highlightColor: Colors.transparent,
  );
}
