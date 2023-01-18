import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/repository/produtoRepositorio.dart';
import 'package:project/views/cadastrosPage/components/produtosScreen.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  final produtoSnapshot = MyFirebase.produtosCollection.snapshots();
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
                  stream: produtoSnapshot,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      final List<QueryDocumentSnapshot> documentos =
                          snapshot.data!.docs;
                      if (documentos.isEmpty) {
                        return Center(
                          child: Text(
                            "Nenhum produto cadastro",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: documentos.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final pordutoId = documentos[index].id;
                          final produto =
                              documentos[index].data() as Map<String, dynamic>;
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
                            //  trailing should be delete and edit button
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ProdutosScreen(
                                          action: ActionScreenProdutos.editar,
                                          id: pordutoId,
                                          nomeProd: nomeProd,
                                          ref: ref,
                                          marca: marca,
                                          un: un,
                                          obs: obs,
                                          vvenda: venda,
                                          estoque: estoque,
                                        ),
                                      ),
                                    );
                                  },
                                  splashRadius: 24,
                                  icon: const Icon(IconlyBold.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ProdutoRepositorio().deletar(pordutoId);
                                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
