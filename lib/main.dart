import 'package:flutter/material.dart';
import 'package:project/auth/inicio.dart';
import 'package:project/auth/login.dart';
import 'package:project/themes/thema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: const Inicio(),
    );
  }
}
