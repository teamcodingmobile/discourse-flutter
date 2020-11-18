import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Search',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
        ),
      ),
      body: Stack(
        children: [
          BarDesing(),
        ],
      ),
    );
  }
}
