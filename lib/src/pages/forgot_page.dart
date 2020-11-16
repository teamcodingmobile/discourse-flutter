import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> createForgot(String user) {
  return http.post(
    'https://mdiscourse.keepcoding.io/session/forgot_password',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      //    'Api-key':
      //        '699667f923e65fac39b632b0d9b2db0d9ee40f9da15480ad5a4bcb3c1b095b7a',
      //    'Api-Username': 'gestionarlaweb',
    },
    body: jsonEncode(<String, String>{
      'login': user,
    }),
  );
}

class ForgotPage extends StatelessWidget {
  // Controller
  final TextEditingController userController = TextEditingController();
  // Controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Container(
            width: 100,
            child: Image.asset('assets/img/discourseLogo89x25.jpg')),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          //BarDesing(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Container(
              child: Column(
                children: [
                  Text(
                    'Recover Password',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    // controller de textField
                    controller: userController,

                    autofocus: true,
                    textCapitalization: TextCapitalization.none,
                    decoration: InputDecoration(hintText: 'Username'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            child: Text(
                              "Send email",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                            onPressed: () => {
                              createForgot(userController.text),
                              Navigator.pushNamed(context, 'login'),
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
