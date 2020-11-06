import 'package:discourse/src/services/topics_service.dart';
import 'package:discourse/src/widgets/bar_desing.dart';
import 'package:discourse/src/widgets/list_topics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topicsService = Provider.of<TopicsService>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Topics',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            ListTopics(topicsService.listTopics, topicsService.listUsers),
            BarDesing(),
          ],
        ),
      ),
    );
  }
}
