import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Cadastros extends StatefulWidget {
  const Cadastros({super.key});

  @override
  State<Cadastros> createState() => _CadastrosState();
}

class _CadastrosState extends State<Cadastros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //controller: pageController,
        children: [
          Cadastros(),
        ],
      ),
    );
  }
}
