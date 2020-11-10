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
        backgroundColor: Colors.white,
        title: Text(
          'Create Topic',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
        iconTheme: IconThemeData(color: Colors.black),
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
      onSubmitted: (value) => Navigator.pushNamed(context, 'tab1page'),
    );
  }
}
