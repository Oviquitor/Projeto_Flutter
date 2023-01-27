import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/views/homePage/financeiro/components/depositar.dart';
import 'package:project/views/homePage/financeiro/components/pagar.dart';
import 'package:project/views/homePage/financeiro/components/receber.dart';
import 'package:project/views/homePage/financeiro/components/sacar.dart';

class Financeiro extends StatefulWidget {
  const Financeiro({super.key});

  @override
  State<Financeiro> createState() => _FinanceiroState();
}

class _FinanceiroState extends State<Financeiro> {
  final vendasSnapshot = MyFirebase.vendasCollection.snapshots();
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
    String formattedDate = DateFormat.yMMMd().format(hoje);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 17)),
                  Container(
                    padding: EdgeInsets.only(right: 50),
                    child: Text(
                      'Meu dinheiro',
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 50,
                      height: 50,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Pagar(),
                            ),
                          );
                        },
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
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
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Receber(),
                            ),
                          );
                        },
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
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
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Depositar(),
                            ),
                          );
                        },
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.account_balance,
                          color: Colors.white,
                        ),
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
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Sacar(),
                            ),
                          );
                        },
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                        ),
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
              Padding(padding: EdgeInsets.only(top: 60)),
              Container(
                padding: EdgeInsets.only(right: 140),
                child: SizedBox(
                  child: Text(
                    'Transações recentes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: vendasSnapshot,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      final List<QueryDocumentSnapshot> doc =
                          snapshot.data!.docs;
                      if (doc.isEmpty) {
                        return Center(
                          child: Text(
                            "Nenhuma venda encontrada",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: doc.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final contactId = doc[index].id;
                          final venda =
                              doc[index].data() as Map<String, dynamic>;
                          final String nome = venda['nome'];
                          final String nomeProd = venda['nomeProd'];
                          final String ref = venda['ref'];
                          final String un = venda['un'];
                          final String marca = venda['marca'];
                          final String obs = venda['obs'];
                          final String vvenda = venda['vvenda'];
                          final String estoque = venda['estoque'];
                          final String quantidade = venda['quantidade'];
                          final int valor = venda['valor'];
                          return ListTile(
                            onTap: () {},
                            title: Text(nome),
                            subtitle: Text("$valor \n$nomeProd"),
                            isThreeLine: true,
                            //  trailing should be delete and edit button
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  splashRadius: 24,
                                  icon: const Icon(Icons.navigate_next),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Erro ao carregar lista"),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
