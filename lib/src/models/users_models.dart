// To parse this JSON data, do
//
//     final usersResponse = usersResponseFromJson(jsonString);

import 'dart:convert';

UsersResponse usersResponseFromJson(String str) =>
    UsersResponse.fromJson(json.decode(str));

String usersResponseToJson(UsersResponse data) => json.encode(data.toJson());

class UsersResponse {
  UsersResponse({
    this.directoryItems,
    this.totalRowsDirectoryItems,
    this.loadMoreDirectoryItems,
  });

  List<DirectoryItem> directoryItems;
  int totalRowsDirectoryItems;
  String loadMoreDirectoryItems;

  factory UsersResponse.fromJson(Map<String, dynamic> json) => UsersResponse(
        directoryItems: List<DirectoryItem>.from(
            json["directory_items"].map((x) => DirectoryItem.fromJson(x))),
        totalRowsDirectoryItems: json["total_rows_directory_items"],
        loadMoreDirectoryItems: json["load_more_directory_items"],
      );

  Map<String, dynamic> toJson() => {
        "directory_items":
            List<dynamic>.from(directoryItems.map((x) => x.toJson())),
        "total_rows_directory_items": totalRowsDirectoryItems,
        "load_more_directory_items": loadMoreDirectoryItems,
      };
}

class DirectoryItem {
  DirectoryItem({
    this.id,
    this.timeRead,
    this.likesReceived,
    this.likesGiven,
    this.topicsEntered,
    this.topicCount,
    this.postCount,
    this.postsRead,
    this.daysVisited,
    this.user,
  });

  int id;
  int timeRead;
  int likesReceived;
  int likesGiven;
  int topicsEntered;
  int topicCount;
  int postCount;
  int postsRead;
  int daysVisited;
  User user;

  factory DirectoryItem.fromJson(Map<String, dynamic> json) => DirectoryItem(
        id: json["id"],
        timeRead: json["time_read"],
        likesReceived: json["likes_received"],
        likesGiven: json["likes_given"],
        topicsEntered: json["topics_entered"],
        topicCount: json["topic_count"],
        postCount: json["post_count"],
        postsRead: json["posts_read"],
        daysVisited: json["days_visited"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time_read": timeRead,
        "likes_received": likesReceived,
        "likes_given": likesGiven,
        "topics_entered": topicsEntered,
        "topic_count": topicCount,
        "post_count": postCount,
        "posts_read": postsRead,
        "days_visited": daysVisited,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.avatarTemplate,
    this.title,
  });

  int id;
  String username;
  String name;
  String avatarTemplate;
  String title;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"] == null ? null : json["name"],
        avatarTemplate: json["avatar_template"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name == null ? null : name,
        "avatar_template": avatarTemplate,
        "title": title == null ? null : title,
      };
}
