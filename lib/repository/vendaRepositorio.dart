import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/repository/my_firebase.dart';

class VendaRepositorio {
  late final String name;
  late final String telefone;
  late final String email;

  void deletar(String id) async {
    await MyFirebase.vendasCollection.doc(id).delete();
  }

  void addVenda(
    GlobalKey<FormState> formKey,
    String? id,
    String? nomeProd,
    String? ref,
    String? un,
    String? marca,
    String? obs,
    String? vvenda,
    String? estoque,
    BuildContext context,
    String? quantidade,
    int? valor,
  ) async {
    final nomeProdController = TextEditingController(text: nomeProd);
    final refController = TextEditingController(text: ref);
    final unController = TextEditingController(text: un);
    final marcaController = TextEditingController(text: marca);
    final obsController = TextEditingController(text: obs);
    final vvendaController = TextEditingController(text: vvenda);
    final estoqueController = TextEditingController(text: estoque);
    final quantidadeController = TextEditingController(text: quantidade);
    if (formKey.currentState!.validate()) {
      try {
        await MyFirebase.vendasCollection.add({
          'nomeProd': nomeProdController.text.trim(),
          'ref': refController.text.trim(),
          'un': unController.text.trim(),
          'marca': marcaController.text.trim(),
          'obs': obsController.text.trim(),
          'vvenda': vvendaController.text.trim(),
          'estoque': estoqueController.text.trim(),
          'quantidade': quantidadeController.text.trim(),
          'valor': valor,
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

  void editar(
      GlobalKey<FormState> formKey,
      String? id,
      String nomeProd,
      String ref,
      String un,
      String marca,
      String obs,
      String vvenda,
      String estoque,
      BuildContext context) async {
    final nomeProdController = TextEditingController(text: nomeProd);
    final refController = TextEditingController(text: ref);
    final unController = TextEditingController(text: un);
    final marcaController = TextEditingController(text: marca);
    final obsController = TextEditingController(text: obs);
    final vvendaController = TextEditingController(text: vvenda);
    final estoqueController = TextEditingController(text: estoque);
    if (formKey.currentState!.validate()) {
      try {
        await MyFirebase.vendasCollection.doc(id).update({
          'nomeProd': nomeProdController.text.trim(),
          'ref': refController.text.trim(),
          'un': unController.text.trim(),
          'marca': marcaController.text.trim(),
          'obs': obsController.text.trim(),
          'vvenda': vvendaController.text.trim(),
          'estoque': estoqueController.text.trim(),
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
