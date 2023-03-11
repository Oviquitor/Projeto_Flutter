import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/views/loginPage/components/login.dart';
import 'package:project/main.dart';
import 'package:project/views/loginPage/components/novoUsuario.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25),
            child: Center(
              child: Container(
                width: 250,
                height: 380,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Financas.png"),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Entrar
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                //Criar Conta
                SizedBox(
                  height: 45,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NovoUsuario(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 150)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Termos de uso',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Text('|'),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Privacidade',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // //Botoes redondo
                // Padding(
                //   padding: const EdgeInsets.only(top: 15),
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
                //   padding: EdgeInsets.only(top: 30),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
