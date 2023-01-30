import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TituloDrawer extends StatelessWidget {
  final IconData iconData;
  final String titulo;
  final int pagina;
  const TituloDrawer(
      {super.key,
      required this.iconData,
      required this.titulo,
      required this.pagina});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            SizedBox(width: 30),
            Icon(
              iconData,
              size: 32,
              color: Colors.grey[700],
            ),
            SizedBox(width: 20),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
