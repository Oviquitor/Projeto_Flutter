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
            Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              height: 170,
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
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: SizedBox(
                child: Text(
                  'Despesas mensais',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              height: 80,
              width: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cards2,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 30,
                    child: Card(
                      elevation: 8.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(),
                        width: 80,
                        height: 60,
                        child: ListTile(
                          title: Text(''),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Card(
            //   elevation: 8.0,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Container(
            //     width: 200,
            //     height: 150,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
