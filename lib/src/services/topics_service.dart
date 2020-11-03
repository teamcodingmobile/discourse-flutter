import 'package:discourse/src/models/topics_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _URL_TOPICS = 'https://mdiscourse.keepcoding.io';

class TopicsService with ChangeNotifier {
  List<Topic> listTopics = [];

  TopicsService() {
    this.getlistTopics();
  }

  getlistTopics() async {
    final url = '$_URL_TOPICS/latest.json';
    final answer = await http.get(url);
    final topicsResponse = topicsResponseFromJson(answer.body);
    this.listTopics.addAll(topicsResponse.topicList.topics);
    notifyListeners();
  }
}
