import 'package:discourse/src/global/environment.dart';
import 'package:discourse/src/models/users_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersService with ChangeNotifier {
  List<Users> listUsers = [];

  UsersService() {
    try {
      this.getlistUsers();
    } catch (e) {
      print(e);
    }
  }

  getlistUsers() async {
    final url = '${Environment.apiUrl}/directory_items.json?period=all';
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
