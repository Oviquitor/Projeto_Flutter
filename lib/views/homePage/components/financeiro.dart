import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Financeiro extends StatefulWidget {
  const Financeiro({super.key});

  @override
  State<Financeiro> createState() => _FinanceiroState();
}

class _FinanceiroState extends State<Financeiro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('financeiro'),
      ),
    );
  }
}
