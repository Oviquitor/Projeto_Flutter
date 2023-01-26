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
  int paginaAtual = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    hoje = DateTime.now();
    String formattedDate = DateFormat.yMMMMd().format(hoje);
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            padding: EdgeInsets.only(right: 300),
            child: Text(
              'Caixa',
              style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 230),
            child: Text(
              'R\$ 150,00',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 40)),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 30)),
              Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(),
                  width: 50,
                  height: 50,
                  child: ListTile(
                    title: Text(''),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 30)),
              Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(),
                  width: 50,
                  height: 50,
                  child: ListTile(
                    title: Text(''),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 30)),
              Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(),
                  width: 50,
                  height: 50,
                  child: ListTile(
                    title: Text(''),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 30)),
              Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(),
                  width: 50,
                  height: 50,
                  child: ListTile(
                    title: Text(''),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Pagar',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Receber',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'Depo.',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 35),
                child: Text(
                  'Sacar',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
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
        ],
      ),
    );
  }
}
