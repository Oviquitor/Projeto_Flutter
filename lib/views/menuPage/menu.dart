import 'package:flutter/material.dart';
import 'package:project/views/cadastrosPage/cadastrosMenu.dart';
import 'package:project/views/cartaoCredito/cartao.dart';
import 'package:project/views/carteira/carteira.dart';
import 'package:project/views/configPage/config.dart';
import 'package:project/views/homePage/home.dart';
import 'package:project/views/homePage/home2.dart';
import 'package:project/views/menuPage/components/customDrawer.dart';
import 'package:project/views/menuPage/components/tituloDrawer.dart';
import 'package:project/views/transacoes/transacoes.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text('Home'),
          ),
        ),
      ],
    );
  }
}
