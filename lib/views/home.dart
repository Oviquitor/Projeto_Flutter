import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    List<IconData> data = [
      Icons.home_outlined,
      Icons.search,
      Icons.add_box_outlined,
      Icons.favorite_outline_sharp,
      Icons.person_outline_sharp,
    ];
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
      ),
    );
  }
}
