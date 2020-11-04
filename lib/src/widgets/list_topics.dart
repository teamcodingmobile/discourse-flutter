import 'package:discourse/src/models/topics_models.dart';
import 'package:discourse/src/theme/base_theme.dart';
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
          user: this.users[index],
          index: index,
        );
      },
    );
  }
}

class _List extends StatelessWidget {
  final Topic topic;
  final int index;
  final User user;

  const _List(
      {@required this.topic, @required this.index, @required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetTopic(index: index, topic: topic),
        _TarjetSlugTopic(topic: topic),
        _TarjetImage(user: user),
      ],
    );
  }
}

class _TarjetImage extends StatelessWidget {
  final User user;

  const _TarjetImage({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (user.avatarTemplate != null)
          ? FadeInImage(
              placeholder: AssetImage('assets/img/giphy.gif'),
              //image: NetworkImage(user.avatarTemplate),
              image: AssetImage('assets/img/no-image.png'),
            )
          : Image(
              image: AssetImage('assets/img/no-image.png'),
            ),
    );
  }
}

class _TarjetSlugTopic extends StatelessWidget {
  final Topic topic;

  const _TarjetSlugTopic({@required this.topic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        topic.slug,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetTopic extends StatelessWidget {
  const _TarjetTopic({
    @required this.index,
    @required this.topic,
  });

  final int index;
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: myTheme.accentColor),
          ),
          Text(
            '${topic.title}. ',
          ),
        ],
      ),
    );
  }
}
