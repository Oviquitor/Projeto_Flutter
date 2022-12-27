import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/views/cadastrosPage/cadastrosPage.dart';
import 'package:project/views/homePage/home.dart';
import 'package:project/views/menuPage/headerDrawer.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var currentPage = DrawerSections.home;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = Home();
    } else if (currentPage == DrawerSections.cadastros) {
      container = Cadastros();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(""),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderDrawer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerList() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          menuItem(1, "Inicio", Icons.home_outlined,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "Cadastros", Icons.person_outlined,
              currentPage == DrawerSections.cadastros ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            if (id == 1) {
              currentPage == DrawerSections.home;
            } else if (id == 2) {
              currentPage == DrawerSections.cadastros;
            }
          });
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
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
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
  home,
  contatos,
  cadastros,
  clientes,
  produtos,
  eventos,
  notas,
  configuracoes,
}
