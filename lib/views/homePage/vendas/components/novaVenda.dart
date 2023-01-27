import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:project/helpers/pesquisaClientes.dart';
import 'package:project/helpers/pesquisaProdutos.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/repository/tmpvendaRepositorio.dart';
import 'package:project/repository/vendaRepositorio.dart';
import 'package:project/views/homePage/vendas/components/search_dialog.dart';

class NovaVenda extends StatefulWidget {
  final String? clienteController;
  const NovaVenda({super.key, this.clienteController});

  @override
  State<NovaVenda> createState() => _NovaVendaState();
}

class _NovaVendaState extends State<NovaVenda> {
  final _formKey = GlobalKey<FormState>();
  final tmpVendasSnapshot = MyFirebase.tmpVendasCollection.snapshots();
  late final clienteController =
      TextEditingController(text: widget.clienteController);

  @override
  Widget build(BuildContext context) {
    var heightListaItens = MediaQuery.of(context).size.height * 0.734;
    var widthButton = MediaQuery.of(context).size.width * 50;

    String? prodid;
    Map<String, dynamic> produt;
    int? valor;
    String? nomeProd;
    String nomePro;
    String? marca;
    String? venda;
    String? ref;
    String? un;
    String? obs;
    String? estoque;
    String? quantidade;
    return Scaffold(
      bottomNavigationBar: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          height: 50,
          child: const Center(
            child: Text(
              "Salvar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        onTap: (() {
          VendaRepositorio().addVenda(
            _formKey,
            prodid,
            nomeProd,
            ref,
            un,
            marca,
            obs,
            venda,
            estoque,
            context,
            quantidade,
            valor,
            clienteController.text,
          );
          tmpVendaRepositorio().deletaColecao();
        }),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          backgroundColor: Colors.blue[500],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => PesquisaProdutos(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: Text('Nova Venda'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Expanded(
                    child: TextFormField(
                      controller: clienteController,
                      decoration: const InputDecoration(
                        labelText: 'Cliente',
                        hintText: 'Nome do cliente',
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PesquisaClientes(),
                            ),
                          );
                        },
                        child: Icon(Icons.search),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                ],
              ),
            ),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: tmpVendasSnapshot,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    final List<QueryDocumentSnapshot> documentos =
                        snapshot.data!.docs;
                    if (documentos.isEmpty) {
                      return Center(
                        child: Text(
                          "Nenhum produto informado",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      );
                    }
                    return Container(
                      padding: const EdgeInsets.all(16),
                      height: heightListaItens,
                      color: Color.fromARGB(255, 202, 227, 247),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: documentos.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            prodid = documentos[index].id;
                            produt = documentos[index].data()
                                as Map<String, dynamic>;
                            nomeProd = produt['nomeProd'];
                            marca = produt['marca'];
                            venda = produt['vvenda'];
                            ref = produt['ref'];
                            un = produt['un'];
                            obs = produt['obs'];
                            estoque = produt['estoque'];
                            quantidade = produt['quantidade'];
                            valor = produt['valor'];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                elevation: 6,
                                child: ListTile(
                                  onTap: () {},
                                  title: Text("$nomeProd"),
                                  subtitle: Text("$marca \nR\$ $valor"),
                                  isThreeLine: true,
                                  //  trailing should be delete and edit button
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          tmpVendaRepositorio().deletar(prodid);
                                        },
                                        splashRadius: 24,
                                        icon: const Icon(IconlyBroken.delete),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
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
