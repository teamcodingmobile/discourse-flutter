import 'dart:convert';

ResetResponse resetResponseFromJson(String str) =>
    ResetResponse.fromJson(json.decode(str));

String resetResponseToJson(ResetResponse data) => json.encode(data.toJson());

class ResetResponse {
  ResetResponse({
    this.login,
  });

  String login;

  factory ResetResponse.fromJson(Map<String, dynamic> json) => ResetResponse(
        login: json["login"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
      };
}
