import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/components/custom_text.dart';
import 'package:project/views/loginPage/inicio.dart';
import 'package:project/views/menuPage/menu.dart';

class Usuario {
  final TextEditingController nomeController;
  final TextEditingController emailController;
  final TextEditingController senhaController;
  final TextEditingController? confirmarSenhaController;
  final bool cadastroUsuario;
  final firebaseAuth = FirebaseAuth.instance;

  Usuario(
      {required this.nomeController,
      required this.emailController,
      required this.senhaController,
      required this.confirmarSenhaController,
      required this.cadastroUsuario});

  usuario(contexto) async {
    try {
      UserCredential? user;
      if (cadastroUsuario) {
        UserCredential usuarioCredencial =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: senhaController.text,
        );
        user = usuarioCredencial;
      } else {
        UserCredential usuarioCredencial =
            await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text,
          password: senhaController.text,
        );
        user = usuarioCredencial;
      }

      if (user != null) {
        Navigator.pushAndRemoveUntil(
            contexto,
            MaterialPageRoute(builder: (BuildContext context) => Menu()),
            (Route<dynamic> route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(contexto).showSnackBar(
          const SnackBar(
            content: Text('Senha invalida'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
