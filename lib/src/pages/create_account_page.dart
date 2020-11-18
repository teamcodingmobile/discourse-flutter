import 'package:discourse/src/models/new_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<NewUserResponse> createUser(
    String name, email, password, username) async {
  final http.Response response = await http.post(
    'https://mdiscourse.keepcoding.io/users.json',
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
            child: (_futureNewUserResponse == null)
                ? Column(
                    children: <Widget>[
                      Text(
                        'Create your account',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controllerUser,
                          decoration: InputDecoration(hintText: 'username'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controllerName,
                          decoration: InputDecoration(hintText: 'name'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controllerEmail,
                          decoration: InputDecoration(hintText: 'email'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _controllerPassword,
                          obscureText: true,
                          autofocus: true,
                          decoration: InputDecoration(hintText: 'password'),
                        ),
                      ),
                      RaisedButton(
                        child: Text(
                          "Send email",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        onPressed: () => {
                          setState(() {
                            _futureNewUserResponse = createUser(
                                _controllerName.text,
                                _controllerEmail.text,
                                _controllerPassword.text,
                                _controllerUser.text);
                          }),
                          //Navigator.pushNamed(context, 'login'),
                        },
                      ),
                    ],
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
