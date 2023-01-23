import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/views/homePage/vendas/components/novaVenda.dart';
import 'package:project/views/homePage/vendas/components/search_dialog.dart';
import 'package:project/views/menuPage/menu.dart';

class Vendas extends StatefulWidget {
  const Vendas({super.key});

  @override
  State<Vendas> createState() => _VendasState();
}

class _VendasState extends State<Vendas> {
  final vendasSnapshot = MyFirebase.vendasCollection.snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: StreamBuilder<QuerySnapshot>(
                  stream: vendasSnapshot,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      final List<QueryDocumentSnapshot> doc =
                          snapshot.data!.docs;
                      if (doc.isEmpty) {
                        return Center(
                          child: Text(
                            "Nenhum cliente cadastro",
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
                          final String name = venda['nome'];
                          final String nomeProd = venda['email'];
                          final String ref = venda['email'];
                          final String un = venda['email'];
                          final String marca = venda['email'];
                          final String obs = venda['email'];
                          final String vvenda = venda['email'];
                          final String estoque = venda['email'];
                          final String quantidade = venda['email'];
                          final int valor = venda['email'];
                          return ListTile(
                            onTap: () {},
                            title: Text(name),
                            subtitle: Text("$valor \n$nomeProd"),
                            isThreeLine: true,
                            //  trailing should be delete and edit button
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  splashRadius: 24,
                                  icon: const Icon(IconlyBold.edit),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  splashRadius: 24,
                                  icon: const Icon(IconlyBroken.delete),
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
                          builder: (BuildContext context) => NovaVenda(),
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
                      backgroundColor: Colors.blue, // <-- Button color
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
