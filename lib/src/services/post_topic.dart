import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<PostResponse> createTopic(String title) async {
  final http.Response response = await http.post(
    'https://mdiscourse.keepcoding.io/posts.json',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Api-key':
          '699667f923e65fac39b632b0d9b2db0d9ee40f9da15480ad5a4bcb3c1b095b7a',
      'Api-Username': 'gestionarlaweb',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'raw': 'Raw por defecto con un mínimo de más de 20 caracteres',
    }),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    return PostResponse.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
    throw Exception('Failed to create Topic.');
  }
}

class PostResponse {
  final String title;

  PostResponse({this.title});

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      title: json['title'],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  Future<PostResponse> _futureTopic;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureTopic == null)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: 'Enter Title'),
                    ),
                    RaisedButton(
                      child: Text('Create Data'),
                      onPressed: () {
                        setState(() {
                          _futureTopic = createTopic(_controller.text);
                        });
                      },
                    ),
                  ],
                )
              : FutureBuilder<PostResponse>(
                  future: _futureTopic,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.title);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
        ),
      ),
    );
  }
}
