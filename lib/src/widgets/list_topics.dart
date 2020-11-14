import 'package:discourse/src/models/topics_models.dart';
import 'package:discourse/src/models/users_models.dart';
import 'package:flutter/material.dart';

class ListTopics extends StatelessWidget {
  final List<Topic> topics;
  final List<DirectoryItem> users;

  const ListTopics(this.topics, this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.topics.length,
      itemBuilder: (BuildContext context, int index) {
        return _List(
          topic: this.topics[index],
          index: index,
          user: this.users[index],
        );
      },
    );
  }
}

class _List extends StatelessWidget {
  final Topic topic;
  final DirectoryItem user;
  final int index;

  const _List({
    @required this.topic,
    @required this.index,
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          child: GestureDetector(
            onTap: () {
              print('ID de la pelicula ${topic.id}');
              Navigator.pushNamed(context, 'detailTopicPage', arguments: topic);
            },
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: _Avatar(
                    user: user,
                  ),
                  title: _UserName(topic: topic),
                  subtitle: _Created(topic: topic),
                ),
                _Title(topic: topic),
                _BottomBar(topic: topic),
              ],
            ),
          ),
        ),
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
                                // style: TextStyle(fontFamily: 'AvenirRegular')
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
                              child: Text(
                                '${topic.postsCount}',
                                //style: TextStyle(fontFamily: 'AvenirBold')
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
                              child: Text('${topic.replyCount}'),
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
  const _Avatar({@required this.user});

  final DirectoryItem user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        //backgroundImage: AssetImage('assets/img/no-image.png'),
        backgroundImage: NetworkImage(user.user.avatarTemplate), // [index]
        radius: 28,
      ),
    );
  }
}
