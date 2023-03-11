import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/views/homePage/vendas/components/novaVenda.dart';
import 'package:project/views/menuPage/components/customDrawer.dart';

class MeuDia extends StatefulWidget {
  const MeuDia({super.key});

  @override
  State<MeuDia> createState() => _MeuDiaState();
}

class _MeuDiaState extends State<MeuDia> {
  final vendasSnapshot = MyFirebase.vendasCollection.snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 22)),
                        Card(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 150,
                            height: 100,
                            child: Column(
                              children: [
                                Container(
                                  child: SizedBox(
                                    child: Text(
                                      'A Receber',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 15)),
                                Container(
                                  child: SizedBox(
                                    child: Text(
                                      'R\$ 2.365,87',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 150,
                            height: 100,
                            child: Column(
                              children: [
                                Container(
                                  child: SizedBox(
                                    child: Text(
                                      'A Pagar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 15)),
                                Container(
                                  child: SizedBox(
                                    child: Text(
                                      'R\$ 1.243,99',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                child: SizedBox(
                  child: Text(
                    'Resumo meu dia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
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
                                  icon: const Icon(IconlyBroken.arrow_up),
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
