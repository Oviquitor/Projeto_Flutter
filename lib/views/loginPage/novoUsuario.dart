import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/components/custom_text.dart';
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
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 350),
                ),
                //nome
                CustomText(
                  icon: Icons.person,
                  label: 'Nome',
                  controller: _nomeController,
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

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Criar usuario',
                      style: TextStyle(fontSize: 18),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
      if (cadastrarCredencial != null) {
        cadastrarCredencial.user!.updateDisplayName(_nomeController.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Inicio(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Seha fraca'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email ja foi usado'),
          ),
        );
      }
    }
  }
}
