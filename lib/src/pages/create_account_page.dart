import 'package:discourse/src/global/environment.dart';
import 'package:discourse/src/models/new_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<NewUserResponse> createUser(
    String name, email, password, username) async {
  final http.Response response = await http.post(
    '${Environment.apiUrl}/users.json',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'password': password,
      'username': username,
    }),
  );

  if (response.statusCode == 200) {
    return NewUserResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load New User');
  }
}

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerUser = TextEditingController();

  Future<NewUserResponse> _futureNewUserResponse;

  GlobalKey<FormState> _formKey = GlobalKey();
  // ignore: unused_field
  String _username = '', _name = '', _email = '', _password = '';

  _submit() {
    final bool isValid = _formKey.currentState.validate();
    if (isValid) {
      setState(() {
        _futureNewUserResponse = createUser(
            _controllerName.text,
            _controllerEmail.text,
            _controllerPassword.text,
            _controllerUser.text);
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

  String _validateName(String name) {
    if (name.isNotEmpty && name.length > 3) {
      name = name;
      return null;
    }
    return "invalid name";
  }

  String _validateEmail(String email) {
    if (email.isNotEmpty && email.contains("@")) {
      _email = email;
      return null;
    }
    return "invalid email";
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
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: (_futureNewUserResponse == null)
                  ? Form(
                      key: _formKey, // Para las validaciones
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Create your account',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _controllerUser,
                              decoration: InputDecoration(
                                  hintText: 'your username',
                                  labelText: 'username'),
                              validator: _validateUsername,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _controllerName,
                              decoration: InputDecoration(
                                  hintText: 'your firts name',
                                  labelText: 'name'),
                              validator: _validateName,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _controllerEmail,
                              decoration: InputDecoration(
                                  hintText: 'email',
                                  labelText: 'exemple@gmail.com'),
                              validator: _validateEmail,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _controllerPassword,
                              obscureText: true,
                              autofocus: true,
                              decoration: InputDecoration(
                                  hintText: 'password',
                                  labelText: 'minium 8 digits'),
                              validator: _validatePassword,
                            ),
                          ),
                          RaisedButton(
                            child: Text(
                              "Send",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                            onPressed: () => {
                              _submit(), // Para las validaciones
                            },
                          ),
                        ],
                      ),
                    )
                  : FutureBuilder<NewUserResponse>(
                      future: _futureNewUserResponse,
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
        ],
      ),
    );
  }
}

class _Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(title: Text('Register success !'));
  }
}
