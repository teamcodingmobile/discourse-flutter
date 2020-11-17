import 'package:flutter/material.dart';

class Tab3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: _ColorAppBar(),
          title: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child:
                          Text('David Rabassa', style: TextStyle(fontSize: 20)),
                    ),
                    subtitle: Text('@gestionarlaweb'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    _BottomBarSimple(),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/img/no-image.png'), // [index]
                        radius: 28,
                      ),
                      title: Text('David Rabassa'),
                      subtitle: Text('4 days ago'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child:
                          Text('3 Simple Ways To Save A Bruch Of Money When'),
                    ),
                    _BottomBar(),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/img/no-image.png'), // [index]
                        radius: 28,
                      ),
                      title: Text('David Rabassa'),
                      subtitle: Text('6 days ago'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                          'Be careful what you believe because that is what you will experience'),
                    ),
                    _BottomBar(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ColorAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            Color.fromRGBO(255, 192, 203, 1),
            Color.fromRGBO(242, 232, 143, 1),
          ])),
    );
  }
}

class _BottomBarSimple extends StatelessWidget {
  //const _BottomBar({@required this.topic});

  //final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          decoration: BoxDecoration(color: const Color(0xfff8f8f8)),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/img/no-image.png'), // [index]
                      radius: 60,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text('Topics'
                                    // '${topic.postsCount}',
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text('Posts'
                                    // '${topic.postsCount}',
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text('Likes'
                                    //'${topic.replyCount}'
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                _TextFixed(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextFixed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text('TOPICS'),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text('POSTS'
                        // '${topic.postsCount}',
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text('LIKES'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  //const _BottomBar({@required this.topic});

  //final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Container(
          decoration: BoxDecoration(color: const Color(0xfff8f8f8)),
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text('50'
                                    //'${topic.postsCount}',

                                    ),
                              ),
                              Container(
                                child: Icon(
                                  Icons.format_list_numbered,
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text('4'
                                    //'${topic.postsCount}',

                                    ),
                              ),
                              Container(
                                child: Icon(
                                  Icons.view_list,
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 45.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  ('23'),
                                  //'${topic.replyCount}',
                                ),
                              ),
                              Container(
                                child: Icon(
                                  Icons.view_list,
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
