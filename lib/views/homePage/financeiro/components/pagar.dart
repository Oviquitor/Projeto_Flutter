import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/views/homePage/financeiro/components/novoPagamento.dart';
import 'package:project/views/homePage/financeiro/components/pagarDialog.dart';

class Pagar extends StatefulWidget {
  const Pagar({super.key});

  @override
  State<Pagar> createState() => _PagarState();
}

class _PagarState extends State<Pagar> {
  final vendasSnapshot = MyFirebase.vendasCollection.snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pagas / A Pagar",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                height: 130,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    SizedBox(
                      height: 90,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "Pesquisar",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 110)),
                    SizedBox(
                      child: Text(
                        'A Pagar',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    SizedBox(
                      child: Text(
                        '|',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    SizedBox(
                      child: Text(
                        'Pagas',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 40)),
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
                                  onPressed: () {
                                    final search = showDialog(
                                      context: context,
                                      builder: (_) => PagarDialog(),
                                    );
                                  },
                                  splashRadius: 24,
                                  icon: const Icon(Icons.arrow_upward),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            NovoPagamento(),
                                      ),
                                    );
                                  },
                                  splashRadius: 24,
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  splashRadius: 24,
                                  icon: const Icon(Icons.delete),
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
              Container(
                padding: EdgeInsets.only(left: 275),
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => NovoPagamento(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(18),
                      backgroundColor: Colors.black, // <-- Button color
                      foregroundColor: Colors.black, // <-- Splash color
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
