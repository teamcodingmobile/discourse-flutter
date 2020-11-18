import 'package:discourse/src/models/users_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _URL_TOPICS = 'https://mdiscourse.keepcoding.io';

class UsersService with ChangeNotifier {
  List<DirectoryItem> listUsers = [];

  UsersService() {
    try {
      this.getlistUsers();
    } catch (e) {
      print(e);
    }
  }

  getlistUsers() async {
    final url = '$_URL_TOPICS/directory_items.json?period=all';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("response Status ${response.statusCode}");

      final usersResponse = usersResponseFromJson(response.body);
      this.listUsers.addAll(usersResponse.directoryItems);
      notifyListeners();
    } else {
      print("response Status ${response.statusCode}");
    }
  }
}
