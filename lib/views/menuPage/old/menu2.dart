import 'package:flutter/material.dart';
import 'package:project/views/cadastrosPage/cadastrosMenu.dart';
import 'package:project/views/cartaoCredito/cartao.dart';
import 'package:project/views/carteira/carteira.dart';
import 'package:project/views/configPage/config.dart';
import 'package:project/views/homePage/home.dart';
import 'package:project/views/homePage/home2.dart';
import 'package:project/views/menuPage/components/tituloDrawer.dart';
import 'package:project/views/menuPage/old/headerDrawer.dart';
import 'package:project/views/transacoes/transacoes.dart';

class Menu2 extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu2> {
  var currentPage = DrawerSections.inicio;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.inicio) {
      container = Home();
    } else if (currentPage == DrawerSections.cadastros) {
      container = Cadastros();
    } else if (currentPage == DrawerSections.cadastros) {
      container = Carteira();
    } else if (currentPage == DrawerSections.cadastros) {
      container = Cartao();
    } else if (currentPage == DrawerSections.cadastros) {
      container = Transacoes();
    } else if (currentPage == DrawerSections.cadastros) {
      container = Configuracoes();
    } else if (currentPage == DrawerSections.cadastros) {
      container = Configuracoes();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // title: Text(
        //   "Fartner Mobile",
        //   style: TextStyle(
        //     color: Colors.black,
        //   ),
        // ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // ação de busca
            },
          ),
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Inicio", Icons.dashboard_outlined,
              currentPage == DrawerSections.inicio ? true : false),
          Padding(padding: EdgeInsets.only(top: 5)),
          menuItem(2, "Cadastros", Icons.content_paste,
              currentPage == DrawerSections.cadastros ? true : false),
          Padding(padding: EdgeInsets.only(top: 5)),
          menuItem(3, "Carteira", Icons.wallet,
              currentPage == DrawerSections.carteira ? true : false),
          Padding(padding: EdgeInsets.only(top: 5)),
          menuItem(4, "Cartão", Icons.credit_card,
              currentPage == DrawerSections.cartao ? true : false),
          Padding(padding: EdgeInsets.only(top: 5)),
          menuItem(5, "Transações", Icons.sync_alt,
              currentPage == DrawerSections.transacoes ? true : false),
          Padding(padding: EdgeInsets.only(top: 5)),
          menuItem(6, "Configurações", Icons.engineering,
              currentPage == DrawerSections.configuracoes ? true : false),
          Padding(padding: EdgeInsets.only(top: 5)),
          menuItem(7, "Sair", Icons.logout,
              currentPage == DrawerSections.sair ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(
            () {
              if (id == 1) {
                currentPage = DrawerSections.inicio;
              } else if (id == 2) {
                currentPage = DrawerSections.cadastros;
              } else if (id == 3) {
                currentPage = DrawerSections.carteira;
              } else if (id == 4) {
                currentPage = DrawerSections.cartao;
              } else if (id == 5) {
                currentPage = DrawerSections.transacoes;
              } else if (id == 6) {
                currentPage = DrawerSections.configuracoes;
              } else if (id == 7) {
                currentPage = DrawerSections.sair;
              }
            },
          );
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  inicio,
  cadastros,
  carteira,
  cartao,
  transacoes,
  configuracoes,
  sair,
}
