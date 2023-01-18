import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:project/repository/produtoRepositorio.dart';

class ProdutosScreen extends StatefulWidget {
  final ActionScreenProdutos action;
  final String? id;
  final String? nomeProd;
  final String? ref;
  final String? un;
  final String? marca;
  final String? obs;
  final String? vvenda;
  final String? estoque;

  const ProdutosScreen({
    super.key,
    required this.action,
    this.id,
    this.nomeProd,
    this.ref,
    this.un,
    this.marca,
    this.obs,
    this.vvenda,
    this.estoque,
  });

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nomeProdController;
  late final TextEditingController refController;
  late final TextEditingController unController;
  late final TextEditingController marcaController;
  late final TextEditingController obsController;
  late final TextEditingController vvendaController;
  late final TextEditingController estoqueController;

  @override
  void initState() {
    nomeProdController = TextEditingController(text: widget.nomeProd);
    refController = TextEditingController(text: widget.ref);
    unController = TextEditingController(text: widget.un);
    marcaController = TextEditingController(text: widget.marca);
    obsController = TextEditingController(text: widget.obs);
    vvendaController = TextEditingController(text: widget.vvenda);
    estoqueController = TextEditingController(text: widget.estoque);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: Container(
        //padding: EdgeInsets.only(top: 160),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 40)),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: nomeProdController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Nome do Produto",
                            prefixIcon: Icon(Icons.people),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe o nome do produto";
                            }
                            return null;
                          },
                        ),
                      ),
                      //Padding(padding: EdgeInsets.only(top: 1)),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: refController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Referencia",
                            prefixIcon: Icon(Icons.numbers),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      //Padding(padding: EdgeInsets.only(top: 20)),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: unController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "UN",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: marcaController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Marca",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: obsController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "obs",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: vvendaController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Valor de Venda",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: estoqueController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "estoque",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 320)),
                      SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          icon: const Icon(IconlyBold.add_user),
                          label: const Text(
                            "Salvar",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            if (widget.action == ActionScreenProdutos.novo) {
                              ProdutoRepositorio().addProduto(
                                  _formKey,
                                  widget.id,
                                  nomeProdController.text,
                                  refController.text,
                                  unController.text,
                                  marcaController.text,
                                  obsController.text,
                                  vvendaController.text,
                                  estoqueController.text,
                                  context);
                            } else {
                              ProdutoRepositorio().editar(
                                  _formKey,
                                  widget.id,
                                  nomeProdController.text,
                                  refController.text,
                                  unController.text,
                                  marcaController.text,
                                  obsController.text,
                                  vvendaController.text,
                                  estoqueController.text,
                                  context);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum ActionScreenProdutos {
  novo,
  editar,
}
