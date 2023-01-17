import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/repository/my_firebase.dart';

class ClienteRepositorio {
  late final String name;
  late final String telefone;
  late final String email;

  void deletar(String id) async {
    await MyFirebase.contactsCollection.doc(id).delete();
  }

  void editar(GlobalKey<FormState> formKey, String? id, String name,
      String telefone, String email, BuildContext context) async {
    final nameController = TextEditingController(text: name);
    final telefoneController = TextEditingController(text: telefone);
    final emailController = TextEditingController(text: email);
    if (formKey.currentState!.validate()) {
      try {
        await MyFirebase.contactsCollection.doc(id).update({
          'nome': nameController.text.trim(),
          'telefone': telefoneController.text.trim(),
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

  void addContact(GlobalKey<FormState> formKey, String? id, String name,
      String telefone, String email, BuildContext context) async {
    final nameController = TextEditingController(text: name);
    final telefoneController = TextEditingController(text: telefone);
    final emailController = TextEditingController(text: email);
    if (formKey.currentState!.validate()) {
      try {
        await MyFirebase.contactsCollection.add({
          'nome': nameController.text.trim(),
          'telefone': telefoneController.text.trim(),
          'email': emailController.text.trim(),
        });
        Navigator.pop(context);
      } on FirebaseException {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Erro ao Adicionar'),
            backgroundColor: Colors.red[300],
          ),
        );
      }
    } else {
      // show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Preencha os campos'),
          backgroundColor: Colors.red[300],
        ),
      );
    }
  }
}
