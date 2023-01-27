import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/repository/my_firebase.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final vendasSnapshot = MyFirebase.vendasCollection.snapshots();
  final int cards1 = 2;
  final int cards2 = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
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
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Bradesco',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              child: Text(
                                'R\$ 7,456.32',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
                            SizedBox(
                              width: 250,
                              child: Text(
                                '2837 2340 0827 6485',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
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
              Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                padding: EdgeInsets.only(right: 230),
                child: SizedBox(
                  child: Text(
                    'Lembretes',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(),
              Padding(padding: EdgeInsets.only(top: 20)),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 350,
                  height: 60,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        child: SizedBox(
                          child: Text(
                            'Pagar fornecedor  -  R\$ 150,00',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          child: Text(
                            'pagar fornecedor ate a data: 27/01/2023',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.grey[100],
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 350,
                  height: 60,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        child: SizedBox(
                          child: Text(
                            'Pagar energia  -  R\$ 200,00',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          child: Text(
                            'pagar energia ate a data: 30/01/2023',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.grey[100],
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 350,
                  height: 60,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        child: SizedBox(
                          child: Text(
                            'Pagar transporte  -  R\$ 95,00',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        child: SizedBox(
                          child: Text(
                            'pagar transporte ate a data: 29/01/2023',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                color: Colors.grey[100],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
