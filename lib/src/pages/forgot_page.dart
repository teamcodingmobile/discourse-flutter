import 'package:flutter/material.dart';

class ForgotPage extends StatelessWidget {
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
          //BarDesing(),
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
    return Container(
      child: Column(
        children: [
          Text(
            'Recover Password',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          TextField(
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(hintText: 'Username'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text(
                      "Send email",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
