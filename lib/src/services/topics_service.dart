import 'package:discourse/src/models/topics_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _URL_TOPICS = 'https://mdiscourse.keepcoding.io';
const _API_KEY =
    '699667f923e65fac39b632b0d9b2db0d9ee40f9da15480ad5a4bcb3c1b095b7a';

class TopicsService with ChangeNotifier {
  List<Topic> listTopics = [];
  // List<User> listUsers = [];

  TopicsService() {
    try {
      this.getlistTopics();
    } catch (e) {
      print(e);
    }
  }

  getlistTopics() async {
    final url = '$_URL_TOPICS/latest.json'; // ?apiKey=$_API_KEY
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("response Status ${response.statusCode}");
      final topicsResponse = topicsResponseFromJson(response.body);
      this.listTopics.addAll(topicsResponse.topicList.topics);
      notifyListeners();
    } else {
      print("response Status ${response.statusCode}");
    }
  }
}
