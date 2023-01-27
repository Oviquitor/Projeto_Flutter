import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Transacoes extends StatefulWidget {
  const Transacoes({super.key});

  @override
  State<Transacoes> createState() => _TransacoesState();
}

class _TransacoesState extends State<Transacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Transacoes')),
    );
  }
}
