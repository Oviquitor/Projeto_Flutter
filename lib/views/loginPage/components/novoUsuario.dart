import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/components/custom_text.dart';
import 'package:project/utils/usuarioFirebase.dart';
import 'package:project/views/loginPage/inicio.dart';

class NovoUsuario extends StatefulWidget {
  const NovoUsuario({super.key});

  @override
  State<NovoUsuario> createState() => _NovoUsuarioState();
}

class _NovoUsuarioState extends State<NovoUsuario> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmarSenhaController = TextEditingController();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    SizedBox(
                      child: Text(
                        'Olá,\nseja bem vindo\nao Finanças',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          height: 1,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 18)),
                    SizedBox(
                      child: Text(
                        'para acessar o aplicativo preencha todos os campos a baixo',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 80)),
                    //nome
                    CustomText(
                      icon: Icons.person,
                      label: 'Nome',
                      controller: _nomeController,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    //Email
                    CustomText(
                      icon: Icons.email,
                      label: 'Email',
                      controller: _emailController,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    //Senha
                    CustomText(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      controller: _senhaController,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),

                    CustomText(
                      icon: Icons.lock,
                      label: 'Confirmar senha',
                      isSecret: true,
                      controller: _confirmarSenhaController,
                    ),

                    const Padding(padding: EdgeInsets.only(top: 60)),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_emailController.text.isEmpty ||
                              _senhaController.text.isEmpty ||
                              _confirmarSenhaController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Preencha todos os campos'),
                              ),
                            );
                          } else {
                            cadastrar();
                          }
                        },
                        child: Text(
                          'Criar usuario',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
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
                            'Já tem uma conta?',
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
                              'Entrar',
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
            ],
          ),
        ),
      ),
    );
  }

  cadastrar() async {
    try {
      UserCredential cadastrarCredencial =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _senhaController.text,
      );
      if (cadastrarCredencial != null &&
          _senhaController.text == _confirmarSenhaController.text) {
        cadastrarCredencial.user!.updateDisplayName(_nomeController.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Inicio(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Senhas nao confere'),
          ),
        );
      }
      ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Informe no minimo 6 caracteres'),
            backgroundColor: Colors.red,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email ja foi usado'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
