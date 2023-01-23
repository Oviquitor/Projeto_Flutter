import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MyFirebase {
  static final _db = FirebaseFirestore.instance;
  static final contactsCollection = _db.collection('clientes');
  static final produtosCollection = _db.collection('produtos');
  static final tmpVendasCollection = _db.collection('tmpvendas');
  static final vendasCollection = _db.collection('vendas');
}
