import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/views/loginPage/login.dart';
import 'package:project/main.dart';
import 'package:project/views/loginPage/novoUsuario.dart';

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
            child: Center(
              child: Container(
                //padding: EdgeInsets.all(20),
                width: 250,
                height: 380,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/FartnerMobile.png"),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 100),
            width: 340,
            //padding: const EdgeInsets.symmetric(
            //  horizontal: 40,
            //  vertical: 160,
            //),
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
                //Botoes redondo
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Ou'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black.withAlpha(90),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 50)),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/Google.png"),
                      ),
                      Padding(padding: EdgeInsets.only(left: 50)),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/Facebook.png"),
                      ),
                      Padding(padding: EdgeInsets.only(left: 50)),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/images/Linkedin.png"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
