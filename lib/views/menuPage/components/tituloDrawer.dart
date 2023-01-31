import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project/models/gerenciamentoPagina.dart';
import 'package:provider/provider.dart';

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
    final int currentPage = context.watch<GerenciamentoPagina>().pagina;
    return InkWell(
      onTap: () {
        context.read<GerenciamentoPagina>().setPage(pagina);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: currentPage == pagina ? Colors.grey[700] : Colors.black,
              ),
            ),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 16,
                color: currentPage == pagina ? Colors.grey[700] : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
