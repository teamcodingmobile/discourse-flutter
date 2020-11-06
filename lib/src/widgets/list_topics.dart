import 'package:discourse/src/models/topics_models.dart';
import 'package:flutter/material.dart';

class ListTopics extends StatelessWidget {
  final List<Topic> topics;
  final List<User> users;
  const ListTopics(this.topics, this.users);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.topics.length,
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
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: _Avatar(
                avatar: avatar,
              ),
              title: _Title(topic: topic),
              subtitle: _Slug(topic: topic),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text('${topic.postsCount}'),
                  padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                  child: Icon(
                    Icons.computer,
                    size: 20.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                  child: Text('${topic.highestPostNumber}'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                  child: Icon(
                    Icons.format_list_numbered,
                    size: 20.0,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                  child: Text('${topic.views}'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.0, bottom: 10.0),
                  child: Icon(
                    Icons.view_list,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key key,
    @required this.topic,
  }) : super(key: key);

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text('${topic.title}'),
    );
  }
}

class _Slug extends StatelessWidget {
  const _Slug({
    Key key,
    @required this.topic,
  }) : super(key: key);

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text('${topic.slug}'),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    Key key,
    @required this.avatar,
  }) : super(key: key);

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
