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

  //late final String pordutoId;
  //late final Map<String, dynamic> produto;

  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(10)),
                    Expanded(
                      child: TextFormField(
                        controller: clienteController,
                        decoration: InputDecoration(
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
                        prodid = documentos[index].id;
                        produt =
                            documentos[index].data() as Map<String, dynamic>;
                        nomeProd = produt['nomeProd'];
                        marca = produt['marca'];
                        venda = produt['vvenda'];
                        ref = produt['ref'];
                        un = produt['un'];
                        obs = produt['obs'];
                        estoque = produt['estoque'];
                        quantidade = produt['quantidade'];
                        valor = produt['valor'];
                        return ListTile(
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
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
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
              ],
            ),
            SizedBox(
              height: 50,
              width: 340,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  
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
                  );
                  tmpVendaRepositorio().deletaColecao();
                },
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
