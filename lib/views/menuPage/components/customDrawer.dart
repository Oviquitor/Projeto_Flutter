import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/views/menuPage/components/tituloDrawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          TituloDrawer(iconData: Icons.home, titulo: 'Home', pagina: 0),
          TituloDrawer(iconData: Icons.home, titulo: 'Home', pagina: 1),
          TituloDrawer(iconData: Icons.home, titulo: 'Home', pagina: 2),
          TituloDrawer(iconData: Icons.home, titulo: 'Home', pagina: 3),
          TituloDrawer(iconData: Icons.home, titulo: 'Home', pagina: 4),
        ],
      ),
    );
  }
}
