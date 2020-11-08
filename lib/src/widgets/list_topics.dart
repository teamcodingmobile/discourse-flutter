import 'package:discourse/src/models/topics_models.dart';
import 'package:flutter/material.dart';

class ListTopics extends StatelessWidget {
  final List<Topic> topics;
  final List<User> users;
  const ListTopics(this.topics, this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 16, //this.topics.length,
      itemBuilder: (BuildContext context, int index) {
        return _List(
          topic: this.topics[index],
          avatar: this.users[index],
          index: index,
        );
      },
    );
  }
}

class _List extends StatelessWidget {
  final Topic topic;
  final int index;
  final User avatar;

  const _List({
    @required this.topic,
    @required this.index,
    @required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: _Avatar(
                  avatar: avatar,
                ),
                title: _UserName(avatar: avatar),
                subtitle: _Created(topic: topic),
              ),
              _Title(topic: topic),
              _BottomBar(topic: topic),
            ],
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
          child: Row(
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('${topic.postsCount}'),
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
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('${topic.postsCount}'),
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
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
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
              child: Text('${topic.title}'),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName({@required this.avatar});

  final User avatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text('${avatar.username}'),
    );
  }
}

class _Created extends StatelessWidget {
  const _Created({@required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    DateTime convert = topic.createdAt;
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      //child: Text('${topic.createdAt}'),
      child: Text('${convert.year}/${convert.month}/${convert.day}'),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({@required this.avatar});

  final User avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/img/no-image.png'),
        radius: 28,
      ),
    );
  }
}
