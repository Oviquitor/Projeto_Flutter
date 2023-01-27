import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';

class NovoRecebimento extends StatefulWidget {
  const NovoRecebimento({super.key});

  @override
  State<NovoRecebimento> createState() => _NovoRecebimentoState();
}

class _NovoRecebimentoState extends State<NovoRecebimento> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // @override
  // void initState() {
  //   nameController = TextEditingController(text: widget.name);
  //   telefoneController = TextEditingController(text: widget.phone);
  //   emailController = TextEditingController(text: widget.email);

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nova conta a receber',
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
                            hintText: "Valor",
                            prefixIcon: Icon(Icons.attach_money),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe o valor";
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
                            hintText: "Observação",
                            prefixIcon: Icon(Icons.store),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            isDense: true,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Informe a obervação";
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
                          onPressed: () {},
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
