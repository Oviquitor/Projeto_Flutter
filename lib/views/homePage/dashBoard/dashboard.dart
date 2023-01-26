import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final int cards1 = 2;
  final int cards2 = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              height: 200,
              width: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards1,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(),
                      width: 300,
                      child: ListTile(
                        title: Text(''),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            SizedBox(
              height: 100,
              width: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards2,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(),
                      width: 90,
                      child: ListTile(
                        title: Text(''),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
