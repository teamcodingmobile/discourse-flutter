import 'package:flutter/material.dart';

class BarDesing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      height: 8,
      //decoration: BoxDecoration(color: Colors.blue),
      decoration: new BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.yellow, Colors.blue],
        ),
      ),
    );
  }
}
