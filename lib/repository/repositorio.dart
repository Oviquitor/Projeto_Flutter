import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/repository/my_firebase.dart';

class Repositorio {
  void deletar(String id) async {
    await MyFirebase.contactsCollection.doc(id).delete();
  }

  void editar(GlobalKey _formKey, String id, String name, String telefone, String email,
      BuildContext context) async {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: name);
    final telefoneController = TextEditingController(text: telefone);
    final emailController = TextEditingController(text: email);

    if (_formKey.currentState!.validate()) {
      try {
        await MyFirebase.contactsCollection.doc(id).update({
          'name': nameController.text.trim(),
          'phone': telefoneController.text.trim(),
          'email': emailController.text.trim(),
        });
        Navigator.pop(context);
      } on FirebaseException {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Erro ao editar cadastro'),
            backgroundColor: Colors.red[300],
          ),
        );
      }
    } else {
      // show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Complete todos os campos'),
          backgroundColor: Colors.red[300],
        ),
      );
    }
  }
}