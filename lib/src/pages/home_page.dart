import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromRGBO(255, 192, 203, 1),
                Color.fromRGBO(242, 232, 143, 1),
              ])),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 100,
                      child: Image.asset('assets/img/discourseLogo405x111.jpg'),
                    ),
                  ),
                )
              ],
            ),
            Text(
              'Cicilized discussion',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            Text(
              'for your',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              'community',
              style: TextStyle(
                fontSize: 22.0,
                decoration: TextDecoration.underline,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () {},
                color: Colors.blue,
                textColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child:
                      Text("Create an account", style: TextStyle(fontSize: 12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
