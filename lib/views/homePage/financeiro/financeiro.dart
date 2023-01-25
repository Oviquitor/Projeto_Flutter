import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Financeiro extends StatefulWidget {
  const Financeiro({super.key});

  @override
  State<Financeiro> createState() => _FinanceiroState();
}

class _FinanceiroState extends State<Financeiro> {
  late DateTime hoje;

  @override
  Widget build(BuildContext context) {
    hoje = DateTime.now();
    String formattedDate = DateFormat.yMMMMd().format(hoje);
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  'Caixa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 155),
                child: Text(
                  'Banco',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'RS 150,00',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 100),
                child: Text(
                  'RS 150,00',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
        ],
      ),
    );
  }
}
