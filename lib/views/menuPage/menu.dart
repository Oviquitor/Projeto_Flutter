import 'package:flutter/material.dart';
import 'package:project/models/gerenciamentoPagina.dart';
import 'package:project/views/cadastrosPage/cadastrosMenu.dart';
import 'package:project/views/homePage/home.dart';
import 'package:project/views/homePage/vendas/vendas.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GerenciamentoPagina(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Home(),
          Cadastros(),
        ],
      ),
    );
  }
}
