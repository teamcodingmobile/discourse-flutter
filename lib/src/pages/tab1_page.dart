import 'package:discourse/src/services/topics_service.dart';
import 'package:discourse/src/services/users_service.dart';
import 'package:discourse/src/theme/base_theme.dart';
import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:discourse/src/widgets/list_topics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topicsService = Provider.of<TopicsService>(context);
    final usersService = Provider.of<UsersService>(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: _ColorAppBar(),
        backgroundColor: Colors.white,
        title: Text(
          'Topics',
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: colorButton,
          onPressed: () => Navigator.pushNamed(context, 'createTopicPage')),
      body: Stack(
        children: [
          BarDesing(),
          ListTopics(topicsService.listTopics, usersService.listUsers),
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
          ],
        ),
      ),
    );
  }
}
