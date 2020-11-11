import 'package:discourse/src/services/users_service.dart';
import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PROVIDER
    Provider.of<UsersService>(context);
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
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
