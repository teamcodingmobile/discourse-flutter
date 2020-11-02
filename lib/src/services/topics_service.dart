import 'package:discourse/src/models/topics_models.dart';
import 'package:flutter/material.dart';

class TopicsService with ChangeNotifier {
  List<TopicList> listTopics = [];

  TopicsService() {
    this.getlistTopics();
  }

  getlistTopics() {
    print('Cargando topics...');
  }
}
