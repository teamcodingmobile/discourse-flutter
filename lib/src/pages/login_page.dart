import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
            child: Column(
              children: [
                Text(
                  'Login on Discourse',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  // _controller,
                  autofocus: true,
                  //textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(hintText: 'Username'),
                ),
                TextField(
                  autofocus: true,
                  obscureText: true,
                  //textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Login'),
                  onPressed: () {
                    // setState(
                    //    () {
                    //      _futureTopic = createTopic(_controller.text);
                    //    },
                    //  );
                  },
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 320),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: GestureDetector(
                                    onTap: () =>
                                        Navigator.pushNamed(context, 'forgot'),
                                    child: Text(
                                      'Forgot your password ?',
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
        ],
      ),
    );
  }
}
