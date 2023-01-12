import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/components/custom_text.dart';

class NovoUsuario extends StatefulWidget {
  const NovoUsuario({super.key});

  @override
  State<NovoUsuario> createState() => _NovoUsuarioState();
}

class _NovoUsuarioState extends State<NovoUsuario> {
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 400),
              ),
              //Email
              CustomText(
                icon: Icons.email,
                label: 'Email',
                controller: _emailController,
              ),

              //Senha
              CustomText(
                icon: Icons.lock,
                label: 'Senha',
                isSecret: true,
                controller: _senhaController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
