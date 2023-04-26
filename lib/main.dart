import 'package:flutter/material.dart';
import 'package:project/firebase_options.dart';
import 'package:project/models/gerenciamentoUsuario.dart';
import 'package:project/views/InicioPage/InicioScreen/InicioScreen.dart';
import 'package:project/themes/thema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  //);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: const FireBase(),
    );
  }
}

class FireBase extends StatefulWidget {
  const FireBase({super.key});

  @override
  State<FireBase> createState() => _FireBaseState();
}

class _FireBaseState extends State<FireBase> {
  Future<FirebaseApp> _initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      name: 'project',
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GerenciamentoUsuario(),
      child: Scaffold(
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return InicioScreen();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
