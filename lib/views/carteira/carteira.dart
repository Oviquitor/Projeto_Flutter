import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Carteira extends StatefulWidget {
  const Carteira({super.key});

  @override
  State<Carteira> createState() => _CarteiraState();
}

class _CarteiraState extends State<Carteira> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Carteira')),
    );
  }
}