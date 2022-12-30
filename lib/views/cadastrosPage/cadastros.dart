import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/views/cadastrosPage/clientes.dart';
import 'package:project/views/cadastrosPage/produtos.dart';

class Cadastros extends StatefulWidget {
  const Cadastros({super.key});

  @override
  State<Cadastros> createState() => _CadastrosState();
}

class _CadastrosState extends State<Cadastros> {
  int paginaAtual = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //permite fazer a navegação em forma de slide
      body: PageView(
        controller: pageController,
        children: [
          Clientes(),
          Produtos(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Clientes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Produtos',
          )
        ],
        onTap: (pagina) {
          pageController.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
