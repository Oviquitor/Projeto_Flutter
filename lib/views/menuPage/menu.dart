import 'package:flutter/material.dart';
import 'package:project/views/cadastrosPage/cadastrosMenu.dart';
import 'package:project/views/configPage/config.dart';
import 'package:project/views/homePage/home.dart';
import 'package:project/views/homePage/home2.dart';
import 'package:project/views/menuPage/headerDrawer.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var currentPage = DrawerSections.inicio;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.inicio) {
      container = Home();
    } else if (currentPage == DrawerSections.cadastros) {
      container = Cadastros();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Fartner Mobile"),
        centerTitle: true,
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
          menuItem(2, "Cadastros", Icons.content_paste,
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
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.inicio;
            } else if (id == 2) {
              currentPage = DrawerSections.cadastros;
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
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback,
}
