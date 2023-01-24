import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              height: 200,
              width: 370,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    width: 1.0,
                    color: Color.fromARGB(255, 36, 34, 34),
                  ),
                ),
                shadowColor: Color.fromARGB(255, 54, 54, 54),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Título do card'),
                      subtitle: Text('Texto do card'),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
