import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/models/usuarioModels.dart';

class GerenciamentoUsuario {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn(UsuarioModels usuario) async {
    UserCredential usuarioCredencial =
        await firebaseAuth.signInWithEmailAndPassword(
      email: usuario.email,
      password: usuario.senha,
    );
  }
}
