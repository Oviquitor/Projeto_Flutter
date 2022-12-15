import 'package:flutter/material.dart';
import 'package:project/components/custom_button.dart';
import 'package:project/components/custom_text.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(45),
                ),
              ),

              //Texto Custom
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Email
                  const CustomText(
                    icon: Icons.email,
                    label: 'Email',
                  ),

                  //Senha
                  const CustomText(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                  ),

                  //Botao Entrar
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  //Esqueceu a Senha
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),

                  //Divisor
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text('Ou'),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.withAlpha(90),
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //BotaoNovo
                  SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
