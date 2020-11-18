import 'package:discourse/src/global/environment.dart';
import 'package:discourse/src/theme/color_appbar.dart';
import 'package:flutter/material.dart';
import 'package:discourse/src/models/users_models.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

User postFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromJson(jsonData);
}

String url = '${Environment.apiUrl}';

Future<User> getPost() async {
  final response = await http.get(
    '$url/users/gestionarlaweb.json',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Api-key': '${Environment.apiKey}',
      'Api-Username': '${Environment.userName}',
    },
  );

  if (response.statusCode == 200) {
    return postFromJson(response.body);
  } else {
    throw Exception('Failed to load New User');
  }
}

class Tab3Page extends StatefulWidget {
  @override
  _Tab3PageState createState() => _Tab3PageState();
}

class _Tab3PageState extends State<Tab3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: ColorAppBar(),
          title: Column(
            children: [
              FutureBuilder<User>(
                future: getPost(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done)
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text('David', // {snapshot.data.name}
                                style: TextStyle(fontSize: 20)),
                          ),
                          subtitle: Text(
                              '@gestionarlaweb'), // @${snapshot.data.username}
                        ),
                      ),
                    );
                  else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    _BottomBarSimple(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomBarSimple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          decoration: BoxDecoration(color: const Color(0xfff8f8f8)),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/img/no-image.png'), // [index]
                      //  NetworkImage(
                      //      'https://mdiscourse.keepcoding.io/users/gestionarlaweb/50/74_2.png)'),
                      radius: 60,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Primera Columna
                    _OneColumn(),
                    // Segona columna
                    _TwoColumn(),
                    // Tercera Columna
                    _TreeColumn(),
                  ],
                ),
                //_TextFixed(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TreeColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('53'
                              // '${topic.postsCount}',
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // seguents...
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('PRIV. MESSAGES'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // Terecera Columna
    );
  }
}

class _TwoColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('12'
                              // '${topic.postsCount}',
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('LAST SEEN'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OneColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('false'
                              // '${topic.postsCount}',
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('MODERATOR'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // seguents...
            ],
          ),
        ],
      ),
    );
  }
}
