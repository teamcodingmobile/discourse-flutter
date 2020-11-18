import 'package:discourse/src/global/environment.dart';
import 'package:discourse/src/models/topics_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopicsService with ChangeNotifier {
  List<Topic> listTopics = [];

  TopicsService() {
    try {
      this.getlistTopics();
    } catch (e) {
      print(e);
    }
  }

  getlistTopics() async {
    final url =
        '${Environment.apiUrl}/latest.json?apiKey=${Environment.apiKey}'; // ?apiKey=$_API_KEY
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
