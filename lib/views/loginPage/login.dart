import 'package:flutter/material.dart';
import 'package:project/components/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/views/loginPage/loginXX.dart';
import 'package:project/views/menuPage/menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final firebaseAuth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                //Texto Custom
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 400),
                    ),
                    //Email
                    CustomText(
                      icon: Icons.email,
                      label: 'Email',
                      controller: _emailController,
                    ),

                    //Senha
                    CustomText(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      controller: _senhaController,
                    ),

                    //Botao Entrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          login();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Menu()),
                              (Route<dynamic> route) => false);
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
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

  login() async {
    try {
      UserCredential usuarioCredencial =
          await firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _senhaController.text,
      );
      if (usuarioCredencial != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Menu(),
          ),
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
