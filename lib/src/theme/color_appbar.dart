import 'package:flutter/material.dart';

class ColorAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[
            Color.fromRGBO(255, 192, 203, 1),
            Color.fromRGBO(242, 232, 143, 1),
          ],
        ),
      ),
    );
  }
}
