import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:project/repository/my_firebase.dart';
import 'package:project/repository/repositorio.dart';
import 'package:project/views/menuPage/menu.dart';

class ClientesScreen extends StatefulWidget {
  final ActionScreenClientes action;
  final String? id;
  final String? name;
  final String? phone;
  final String? email;

  const ClientesScreen({
    super.key,
    required this.action,
    this.id,
    this.name,
    this.phone,
    this.email,
  });

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
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
        title: Text(
          widget.action == ActionScreenClientes.editar
              ? 'Edição de cadastro'
              : 'Novo cadastro',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
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
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Informe o email";
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: "Nome",
                          //contentPadding: EdgeInsets.all(1),
                        ),
                      ),
                      const SizedBox(),
                      TextFormField(
                        controller: telefoneController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Informe o numero";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Numero",
                          //contentPadding: EdgeInsets.all(14),
                        ),
                      ),
                      const SizedBox(),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Informe o email";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          contentPadding: EdgeInsets.all(14),
                        ),
                      ),
                      const SizedBox(),
                      SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              if (widget.action == ActionScreenClientes.novo) {
                              } else {
                                Repositorio().editar(
                                  _formKey,
                                  widget.id,
                                  nameController.text,
                                  telefoneController.text,
                                  emailController.text,
                                  context,
                                );
                              }
                            },
                            icon: const Icon(IconlyBroken.add_user),
                            label: const Text("Salvar")),
                      )
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

enum ActionScreenClientes {
  novo,
  editar,
}
