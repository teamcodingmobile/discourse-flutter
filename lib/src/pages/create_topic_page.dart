import 'dart:io';

import 'dart:async';
import 'dart:convert';

import 'package:discourse/src/global/environment.dart';
import 'package:discourse/src/models/create_topic_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';

Future<CreateTopictResponse> createTopic(String title) async {
  final http.Response response = await http.post(
    '${Environment.apiUrl}/posts.json',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Api-key': '${Environment.apiKey}',
      'Api-Username': '${Environment.userName}',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'raw': 'Raw por defecto con un mínimo de más de 20 caracteres',
    }),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    return CreateTopictResponse.fromJson(jsonDecode(response.body));
  } else {
    print(response.body);
    throw Exception('Failed to create Topic.');
  }
}

class CreateTopicPage extends StatefulWidget {
  @override
  _CreateTopicPageState createState() => _CreateTopicPageState();
}

class _CreateTopicPageState extends State<CreateTopicPage> {
  // Controller
  final TextEditingController _controller = TextEditingController();
  Future<CreateTopictResponse> _futureTopic;

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
            child: (_futureTopic == null)
                ? Column(
                    children: <Widget>[
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(hintText: 'Enter Title'),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text('Create'),
                        onPressed: () => {
                          setState(
                            () {
                              _futureTopic = createTopic(_controller.text);
                            },
                          ),
                        },
                      ),
                    ],
                  )
                : FutureBuilder<CreateTopictResponse>(
                    future: _futureTopic,
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

class _Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(title: Text('Register new topic success !'));
  }
}
