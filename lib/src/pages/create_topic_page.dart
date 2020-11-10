import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';

class CreateTopicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Create Topic',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          BarDesing(),
        ],
      ),
    );
  }
}
