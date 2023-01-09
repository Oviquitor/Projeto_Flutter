import 'package:flutter/material.dart';
import 'package:project/views/loginPage/inicio.dart';
import 'package:project/views/loginPage/login.dart';
import 'package:project/themes/thema.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
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
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Inicio();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  void initState() {
    //super.initState();
    //Future.delayed(Duration(seconds: 3)).then((value) => null)
  }

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/inicial.png"),
          fit: BoxFit.cover,
        ),
      ),
      //child: Center(child: ,),
    );
  }
}
