import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderDrawer extends StatefulWidget {
  const HeaderDrawer({super.key});

  @override
  State<HeaderDrawer> createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/profile.jpg"),
              ),
            ),
          ),
          Text(
            "Seu Cleitin",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          Text(
            "cleitin@obrabo.com.br",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }
}
