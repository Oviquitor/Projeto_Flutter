import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:project/repository/clienteRepositorio.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/views/cadastrosPage/components/clientesScreen.dart';
import 'package:project/views/homePage/vendas/components/novaVenda.dart';
import 'package:project/views/homePage/vendas/components/search_dialog.dart';

class PesquisaProdutos extends StatefulWidget {
  const PesquisaProdutos({super.key});

  @override
  State<PesquisaProdutos> createState() => _PesquisaProdutosState();
}

class _PesquisaProdutosState extends State<PesquisaProdutos> {
  final textController = TextEditingController();
  final produtosSnapshot = MyFirebase.produtosCollection.snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Pesquisar Produtos",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
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
                stream: produtosSnapshot,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final List<QueryDocumentSnapshot> doc = snapshot.data!.docs;
                    if (doc.isEmpty) {
                      return Center(
                        child: Text(
                          "Nenhum produto encontrado",
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
                        final produtoId = doc[index].id;
                        final produto =
                            doc[index].data() as Map<String, dynamic>;
                        final String nomeProd = produto['nomeProd'];
                        final String marca = produto['marca'];
                        final String venda = produto['vvenda'];
                        final String ref = produto['ref'];
                        final String un = produto['un'];
                        final String obs = produto['obs'];
                        final String estoque = produto['estoque'];
                        return ListTile(
                          onTap: () {},
                          title: Text(nomeProd),
                          subtitle: Text("$marca \n$venda"),
                          isThreeLine: true,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final search = showDialog(
                                    context: context,
                                    builder: (_) => SearchDialog(
                                      id: produtoId,
                                      nomeProd: nomeProd,
                                      ref: ref,
                                      marca: marca,
                                      un: un,
                                      obs: obs,
                                      vvenda: venda,
                                      estoque: estoque,
                                    ),
                                  );
                                  // if (search != null) {
                                  //   SearchDialog(
                                  //     id: produtoId,
                                  //     nomeProd: nomeProd,
                                  //     ref: ref,
                                  //     marca: marca,
                                  //     un: un,
                                  //     obs: obs,
                                  //     vvenda: venda,
                                  //     estoque: estoque,
                                  //     value: '0',
                                  //   );
                                  // }
                                },
                                splashRadius: 24,
                                icon: const Icon(IconlyBroken.arrow_right),
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
    );
  }
}
