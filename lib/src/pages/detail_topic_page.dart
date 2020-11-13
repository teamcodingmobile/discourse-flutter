import 'dart:io';
import 'package:discourse/src/models/topics_models.dart';
import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';

class DetailTopicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Topic topic = ModalRoute.of(context).settings.arguments;

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
            child: Text('${topic.title}'),
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
        'Detail Topic',
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
        'Detail Topic',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
