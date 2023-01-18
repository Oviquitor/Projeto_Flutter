import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MeuDia extends StatefulWidget {
  const MeuDia({super.key});

  @override
  State<MeuDia> createState() => _MeuDiaState();
}

class _MeuDiaState extends State<MeuDia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('meu dia'),
      ),
    );
  }
}
