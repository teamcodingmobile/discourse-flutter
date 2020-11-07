import 'package:flutter/material.dart';

class BarDesing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 414,
        height: 8,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.9999999999999996, 0.5),
                end: Alignment(0, 0.5),
                colors: [const Color(0xff00aeef), const Color(0xfff2e88f)])));
  }
}
