import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProdutosScreen extends StatefulWidget {
  final ActionScreenProdutos action;
  final String? id;
  final String? name;
  final String? phone;
  final String? email;

  const ProdutosScreen({
    super.key,
    required this.action,
    this.id,
    this.name,
    this.phone,
    this.email,
  });

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController telefoneController;
  late final TextEditingController emailController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.name);
    telefoneController = TextEditingController(text: widget.phone);
    emailController = TextEditingController(text: widget.email);

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
                          controller: nameController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Nome",
                            prefixIcon: Icon(Icons.people),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe o email";
                            }
                            return null;
                          },
                        ),
                      ),
                      //Padding(padding: EdgeInsets.only(top: 1)),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: telefoneController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Numero",
                            prefixIcon: Icon(Icons.numbers),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe o numero";
                            }
                            return null;
                          },
                        ),
                      ),
                      //Padding(padding: EdgeInsets.only(top: 20)),
                      SizedBox(
                        height: 70,
                        child: TextFormField(
                          controller: emailController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe o email";
                            }
                            return null;
                          },
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
                          icon: const Icon(IconlyBroken.add_user),
                          label: const Text(
                            "Salvar",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            if (widget.action == ActionScreenClientes.novo) {
                              ClienteRepositorio().addContact(
                                  _formKey,
                                  widget.id,
                                  nameController.text,
                                  telefoneController.text,
                                  emailController.text,
                                  context);
                            } else {
                              ClienteRepositorio().editar(
                                _formKey,
                                widget.id,
                                nameController.text,
                                telefoneController.text,
                                emailController.text,
                                context,
                              );
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
