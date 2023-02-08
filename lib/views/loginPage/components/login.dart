import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:project/components/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/views/loginPage/components/esqueceuSenha.dart';
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
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            //Texto Custom
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(padding: EdgeInsets.only(top: 70)),
                Container(
                  child: Column(
                    children: [
                      const Align(
                        child: Text.rich(
                          TextSpan(
                            style: TextStyle(
                              fontSize: 40,
                            ),
                            children: [
                              TextSpan(
                                text: 'Olá, bem vindo',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: 'Entre com a sua conta OutSet',
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SizedBox(
                //       child: Text.rich(
                //         TextSpan(
                //           style: TextStyle(
                //             fontSize: 40,
                //           ),
                //           children: [
                //             TextSpan(
                //               text: 'Ola, ',
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       height: 48,
                //       width: 200,
                //       child: DefaultTextStyle(
                //         style: TextStyle(
                //           fontSize: 40,
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         child: AnimatedTextKit(
                //           pause: Duration.zero,
                //           repeatForever: true,
                //           animatedTexts: [
                //             FadeAnimatedText('Bem Vindo'),
                //             FadeAnimatedText('Welcome'),
                //             FadeAnimatedText('歡迎'),
                //             FadeAnimatedText('Bienvenido'),
                //             FadeAnimatedText('أهلا بك'),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                const Padding(padding: EdgeInsets.only(top: 180)),
                //Email
                CustomText(
                  icon: Icons.email,
                  label: 'Email',
                  controller: _emailController,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                //Senha
                CustomText(
                  icon: Icons.lock,
                  label: 'Senha',
                  isSecret: true,
                  controller: _senhaController,
                ),
                Row(
                  children: [
                    Container(
                      child: Checkbox(
                        value: _isChecked,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      child: const Text(
                        'Manter-me logado',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) => RedefinirSenha()),
                            ),
                          );
                        },
                        child: const Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
                //Botao Entrar
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    onPressed: () {
                      if (_emailController.text.isEmpty ||
                          _senhaController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Informe o email e a senha'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        //login();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Menu()),
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.only(top: 30),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Divider(
                //           color: Colors.black.withAlpha(90),
                //           thickness: 2,
                //         ),
                //       ),
                //       const Padding(
                //         padding: EdgeInsets.symmetric(horizontal: 15),
                //         child: Text('Ou'),
                //       ),
                //       Expanded(
                //         child: Divider(
                //           color: Colors.black.withAlpha(90),
                //           thickness: 2,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.only(top: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       IconButton(
                //         onPressed: () {},
                //         icon: Image.asset("assets/images/Google.png"),
                //       ),
                //       Padding(padding: EdgeInsets.only(left: 50)),
                //       IconButton(
                //         onPressed: () {},
                //         icon: Image.asset("assets/images/Facebook.png"),
                //       ),
                //       Padding(padding: EdgeInsets.only(left: 50)),
                //       IconButton(
                //         onPressed: () {},
                //         icon: Image.asset("assets/images/Linkedin.png"),
                //       ),
                //     ],
                //   ),
                // ),

                Padding(padding: const EdgeInsets.only(top: 25)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      child: Text(
                        'Ainda não tem uma conta?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Menu()),
          (Route<dynamic> route) => false,
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
