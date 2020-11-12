import 'dart:io';

import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:flutter/material.dart';

class CreateTopicPage extends StatefulWidget {
  @override
  _CreateTopicPageState createState() => _CreateTopicPageState();
}

class _CreateTopicPageState extends State<CreateTopicPage> {
  String _myTopicString;

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
            child: _myInput(),
          ),
        ],
      ),
    );
  }

  Widget _myInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(hintText: 'Write your new topic'),
      onChanged: (value) {
        setState(() {
          _myTopicString = value;
          print(_myTopicString);
        });
      },
      onSubmitted: (value) => Navigator.pop(context),
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
