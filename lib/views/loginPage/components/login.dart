import 'package:flutter/material.dart';
import 'package:project/components/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/helpers/validadores.dart';
import 'package:project/models/gerenciamentoUsuario.dart';
import 'package:project/models/usuarioModels.dart';
import 'package:project/views/loginPage/components/esqueceuSenha.dart';
import 'package:project/views/menuPage/menu.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final firebaseAuth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              //Texto Custom
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 70)),
                  Container(
                    child: Column(
                      children: [
                        const Align(
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 40,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Olá, bem vindo',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          child: Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Entre com a sua conta Finanças',
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Padding(padding: EdgeInsets.only(top: 180)),
                  //Email
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    validator: (email) {
                      if (emailValidador(email!)) return 'E-mail inválido';
                      return null;
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                  //Senha
                  CustomText(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                    controller: _senhaController,
                  ),
                  Row(
                    children: [
                      Container(
                        child: Checkbox(
                          value: _isChecked,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        child: const Text(
                          'Manter-me logado',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) => RedefinirSenha()),
                              ),
                            );
                          },
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                  //Botao Entrar
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          context.read<GerenciamentoUsuario>().signIn(
                                UsuarioModels(
                                  _emailController.text,
                                  _senhaController.text,
                                ),
                              );
                        }
                        // if (_emailController.text.isEmpty ||
                        //     _senhaController.text.isEmpty) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Informe o email e a senha'),
                        //       backgroundColor: Colors.red,
                        //     ),
                        //   );
                        // } else {
                        //   //login();

                        //   Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) => Menu()),
                        //     (Route<dynamic> route) => false,
                        //   );
                        // }
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  Padding(padding: const EdgeInsets.only(top: 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: Text(
                          'Ainda não tem uma conta?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Cadastrar',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      UserCredential usuarioCredencial =
          await firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _senhaController.text,
      );
      if (usuarioCredencial != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Menu()),
          (Route<dynamic> route) => false,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario nao encontrado'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha invalida'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
