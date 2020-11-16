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
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: 150,
                        child:
                            Image.asset('assets/img/discourseLogo405x111.jpg'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Container(
                child: Text(
                  'Cicilized discussion',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 108.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'for your',
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 108.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'community',
                  style: TextStyle(
                    fontSize: 22.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: BorderSide(color: Colors.blue)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'createAccount');
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Text("Create an account",
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 100.0, top: 320),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              child: GestureDetector(
                                onTap: () =>
                                    Navigator.pushNamed(context, 'login'),
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
