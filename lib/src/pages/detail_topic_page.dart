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
          Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: _Avatar(),
                  title: _UserName(topic: topic),
                  subtitle: _Created(topic: topic),
                ),
                _Title(topic: topic),
                _BottomBar(topic: topic),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: ListView(
              // Segunda Tarjeta listado de tarjetas de GET Posts)
              children: <Widget>[
                Card(
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/img/no-image.png'),
                          radius: 28,
                        ),
                        title:
                            Text('RAW: prueba 2 a contestar un topic de david'),
                        subtitle: Text('User que ha hecho POST al topic'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text('updated_at: 2020-11-15T21:15:29.225Z'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // ),
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

class _BottomBar extends StatelessWidget {
  const _BottomBar({@required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              child: Text(
                                '${topic.postsCount}',
                              ),
                            ),
                            Container(
                              child: ImageIcon(
                                AssetImage('assets/icons/eye.png'),
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
                              child: Text(
                                '${topic.postsCount}',
                              ),
                            ),
                            Container(
                              child: Icon(
                                Icons.announcement,
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
                              child: Text('${topic.replyCount}'),
                            ),
                            Container(
                              child: Icon(
                                Icons.reply,
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
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({@required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(left: 20.0, bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                '${topic.title}',
                //style: TextStyle(fontFamily: 'AvenirBold')
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName({@required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        '${topic.lastPosterUsername}',
        //style: TextStyle(fontFamily: 'AvenirBold')
      ),
    );
  }
}

class _Created extends StatelessWidget {
  const _Created({@required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    DateTime dateApi = topic.createdAt;
    DateTime now = new DateTime.now();
    var diffDt = now.difference(dateApi);

    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: (diffDt.inDays < 1)
          ? Text('${diffDt.inHours} hours ago')
          : Text('${diffDt.inDays} days ago'),
    );
  }
}

class _Avatar extends StatelessWidget {
  //const _Avatar({@required this.user});

  //final DirectoryItem user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/img/no-image.png'),
        //backgroundImage: NetworkImage(avatar.user.avatarTemplate), // [index]
        radius: 28,
      ),
    );
  }
}
