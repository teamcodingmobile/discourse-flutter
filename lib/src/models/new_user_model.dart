// To parse this JSON data, do
//
//     final newUserResponse = newUserResponseFromJson(jsonString);

import 'dart:convert';

NewUserResponse newUserResponseFromJson(String str) =>
    NewUserResponse.fromJson(json.decode(str));

String newUserResponseToJson(NewUserResponse data) =>
    json.encode(data.toJson());

class NewUserResponse {
  NewUserResponse({
    this.name,
    this.email,
    this.password,
    this.username,
    this.active,
    this.approved,
    this.userFields1,
  });

  String name;
  String email;
  String password;
  String username;
  bool active;
  bool approved;
  String userFields1;

  factory NewUserResponse.fromJson(Map<String, dynamic> json) =>
      NewUserResponse(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        username: json["username"],
        active: json["active"],
        approved: json["approved"],
        userFields1: json["user_fields[1]"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "username": username,
        "active": active,
        "approved": approved,
        "user_fields[1]": userFields1,
      };
}
