import 'package:discourse/src/models/login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<LoginResponse> loginUser(String username) async {
  final http.Response response = await http.post(
    'https://mdiscourse.keepcoding.io/users/gestionarlaweb.json',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
    }),
  );
  print(response.body);
  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to search User');
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = TextEditingController();

  Future<LoginResponse> _futureUserResponse;

  GlobalKey<FormState> _formKey = GlobalKey();
  // ignore: unused_field
  String _username = '', _password = '';

  _submit() {
    final bool isValid = _formKey.currentState.validate();
    if (isValid) {
      setState(() {
        Navigator.pushNamed(context, 'tabspage');
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

  String _validatePassword(String password) {
    if (password.isNotEmpty && password.length > 8) {
      _password = password;
      return null;
    }
    return "invalid password";
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
          Container(
            padding: const EdgeInsets.all(12.0),
            child: (_futureUserResponse == null)
                ? Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Login on Discourse',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: userController,
                          autofocus: true,
                          decoration: InputDecoration(
                              hintText: 'Username', labelText: 'username'),
                          validator: _validateUsername,
                        ),
                        TextFormField(
                          //controller: passController,
                          autofocus: true,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: 'password',
                              labelText: 'minium 8 digits'),
                          validator: _validatePassword,
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('Login'),
                          onPressed: () => {
                            _submit(),
                          },
                        ),
                        Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 110.0, top: 120),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          child: GestureDetector(
                                            onTap: () => Navigator.pushNamed(
                                                context, 'forgot'),
                                            child: Text(
                                              'Forgot your password ?',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : FutureBuilder<LoginResponse>(
                    future: _futureUserResponse,
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
        ],
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Login success !'),
    );
  }
}
