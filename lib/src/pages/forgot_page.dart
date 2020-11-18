import 'package:discourse/src/global/environment.dart';
import 'package:discourse/src/models/reset_password_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<ResetResponse> resetPassword(String login) async {
  final http.Response response = await http.post(
    '${Environment.apiUrl}/session/forgot_password',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Api-key': '${Environment.apiKey}',
      'Api-Username': '${Environment.userName}',
    },
    body: jsonEncode(<String, String>{
      'login': login,
    }),
  );

  if (response.statusCode == 200) {
    return ResetResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to reset password');
  }
}

class ForgotPage extends StatefulWidget {
  // Controller
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController userController = TextEditingController();

  Future<ResetResponse> _futureResetResponse;

  GlobalKey<FormState> _formKey = GlobalKey();
  // ignore: unused_field
  String _username = '';

  _submit() {
    final bool isValid = _formKey.currentState.validate();
    if (isValid && _username == 'gestionarlaweb' || _username == 'admin') {
      setState(() {
        _futureResetResponse = resetPassword(userController.text);
      });
    }
  }

  String _validateUsername(String username) {
    if (username.isNotEmpty && username.length > 3) {
      _username = username;
      return null;
    }
    return "invalid username";
  }

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
          SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                child: Container(
                  child: (_futureResetResponse == null)
                      ? Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Recover Password',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: userController,
                                autofocus: true,
                                textCapitalization: TextCapitalization.none,
                                decoration: InputDecoration(
                                    hintText: 'Username',
                                    labelText: 'username'),
                                validator: _validateUsername,
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
                                          _submit(),
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : FutureBuilder<ResetResponse>(
                          future: _futureResetResponse,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return _Dialog();
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }

                            return CircularProgressIndicator();
                          },
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Send reset password success !'),
    );
  }
}
