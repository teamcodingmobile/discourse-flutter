import 'dart:io';

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';

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

class CreateTopicPage extends StatefulWidget {
  @override
  _CreateTopicPageState createState() => _CreateTopicPageState();
}

class _CreateTopicPageState extends State<CreateTopicPage> {
  // Controller
  final TextEditingController _controller = TextEditingController();
  Future<PostResponse> _futureTopic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: (Platform.isAndroid)
            ? _TextTitleTopicAndroid()
            : _TextTitleTopiciOs(),
      ),
      body: Stack(
        children: [
          BarDesing(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            //child: _myInput(),

            child: (_futureTopic == null)
                ? Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(hintText: 'Enter Title'),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text('Create'),
                        onPressed: () {
                          setState(
                            () {
                              _futureTopic = createTopic(_controller.text);
                            },
                          );
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
        ],
      ),
    );
  }
}

class _TextTitleTopicAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 60.0),
      child: Text(
        'Create Topic',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}

class _TextTitleTopiciOs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Create Topic',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
