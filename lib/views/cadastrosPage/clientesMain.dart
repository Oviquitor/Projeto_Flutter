import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Clientes extends StatefulWidget {
  const Clientes({super.key});

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 120,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
