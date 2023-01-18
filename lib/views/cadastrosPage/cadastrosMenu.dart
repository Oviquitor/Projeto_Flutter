import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/views/cadastrosPage/clientesMain.dart';
import 'package:project/views/cadastrosPage/components/clientesScreen.dart';
import 'package:project/views/cadastrosPage/produtosMain.dart';
import 'package:project/views/cadastrosPage/components/produtosScreen.dart';
import 'package:project/views/configPage/config.dart';

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
    return Container(
      child: Scaffold(
        //permite fazer a navegação em forma de slide
        body: PageView(
          controller: pageController,
          children: [
            Clientes(),
            Produtos(),
          ],
          onPageChanged: setPaginaAtual,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (paginaAtual == 0) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        ClientesScreen(action: ActionScreenClientes.novo)),
              );
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        ProdutosScreen(action: ActionScreenProdutos.novo)),
              );
            }
          },
          child: Icon(Icons.add),
          elevation: 10,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: paginaAtual,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'Clientes'),
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
          /*onTap: (pagina) {
          pageController.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
          
        },*/
        ),

        /*floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).colorScheme.primary,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    pageController.animateToPage(paginaAtual,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.ease);
                  },
                ),
                SizedBox(width: 24),
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),*/
      ),
    );
  }
}
