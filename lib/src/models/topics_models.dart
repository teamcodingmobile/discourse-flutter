// To parse this JSON data, do
//
//     final topicsResponse = topicsResponseFromJson(jsonString);

import 'dart:convert';

TopicsResponse topicsResponseFromJson(String str) =>
    TopicsResponse.fromJson(json.decode(str));

String topicsResponseToJson(TopicsResponse data) => json.encode(data.toJson());

class TopicsResponse {
  TopicsResponse({
    this.users,
    this.primaryGroups,
    this.topicList,
  });

  final List<User> users;
  final List<dynamic> primaryGroups;
  final TopicList topicList;

  factory TopicsResponse.fromJson(Map<String, dynamic> json) => TopicsResponse(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
        primaryGroups: List<dynamic>.from(json["primary_groups"].map((x) => x)),
        topicList: TopicList.fromJson(json["topic_list"]),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
        "primary_groups": List<dynamic>.from(primaryGroups.map((x) => x)),
        "topic_list": topicList.toJson(),
      };
}

class TopicList {
  TopicList({
    this.canCreateTopic,
    this.moreTopicsUrl,
    this.draft,
    this.draftKey,
    this.draftSequence,
    this.perPage,
    this.topics,
  });

  final bool canCreateTopic;
  final String moreTopicsUrl;
  final dynamic draft;
  final String draftKey;
  final int draftSequence;
  final int perPage;
  final List<Topic> topics;

  factory TopicList.fromJson(Map<String, dynamic> json) => TopicList(
        canCreateTopic: json["can_create_topic"],
        moreTopicsUrl: json["more_topics_url"],
        draft: json["draft"],
        draftKey: json["draft_key"],
        draftSequence: json["draft_sequence"],
        perPage: json["per_page"],
        topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "can_create_topic": canCreateTopic,
        "more_topics_url": moreTopicsUrl,
        "draft": draft,
        "draft_key": draftKey,
        "draft_sequence": draftSequence,
        "per_page": perPage,
        "topics": List<dynamic>.from(topics.map((x) => x.toJson())),
      };
}

class Topic {
  Topic({
    this.id,
    this.title,
    this.fancyTitle,
    this.slug,
    this.postsCount,
    this.replyCount,
    this.highestPostNumber,
    this.imageUrl,
    this.createdAt,
    this.lastPostedAt,
    this.bumped,
    this.bumpedAt,
    this.unseen,
    this.lastReadPostNumber,
    this.unread,
    this.newPosts,
    this.pinned,
    this.unpinned,
    this.excerpt,
    this.visible,
    this.closed,
    this.archived,
    this.notificationLevel,
    this.bookmarked,
    this.liked,
    this.views,
    this.likeCount,
    this.hasSummary,
    this.archetype,
    this.lastPosterUsername,
    this.categoryId,
    this.pinnedGlobally,
    this.featuredLink,
    this.posters,
  });

  final int id;
  final String title;
  final String fancyTitle;
  final String slug;
  final int postsCount;
  final int replyCount;
  final int highestPostNumber;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime lastPostedAt;
  final bool bumped;
  final DateTime bumpedAt;
  final bool unseen;
  final int lastReadPostNumber;
  final int unread;
  final int newPosts;
  final bool pinned;
  final dynamic unpinned;
  final String excerpt;
  final bool visible;
  final bool closed;
  final bool archived;
  final int notificationLevel;
  final bool bookmarked;
  final bool liked;
  final int views;
  final int likeCount;
  final bool hasSummary;
  final Archetype archetype;
  final String lastPosterUsername;
  final int categoryId;
  final bool pinnedGlobally;
  final dynamic featuredLink;
  final List<Poster> posters;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["id"],
        title: json["title"],
        fancyTitle: json["fancy_title"],
        slug: json["slug"],
        postsCount: json["posts_count"],
        replyCount: json["reply_count"],
        highestPostNumber: json["highest_post_number"],
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        lastPostedAt: DateTime.parse(json["last_posted_at"]),
        bumped: json["bumped"],
        bumpedAt: DateTime.parse(json["bumped_at"]),
        unseen: json["unseen"],
        lastReadPostNumber: json["last_read_post_number"] == null
            ? null
            : json["last_read_post_number"],
        unread: json["unread"] == null ? null : json["unread"],
        newPosts: json["new_posts"] == null ? null : json["new_posts"],
        pinned: json["pinned"],
        unpinned: json["unpinned"],
        excerpt: json["excerpt"] == null ? null : json["excerpt"],
        visible: json["visible"],
        closed: json["closed"],
        archived: json["archived"],
        notificationLevel: json["notification_level"] == null
            ? null
            : json["notification_level"],
        bookmarked: json["bookmarked"] == null ? null : json["bookmarked"],
        liked: json["liked"] == null ? null : json["liked"],
        views: json["views"],
        likeCount: json["like_count"],
        hasSummary: json["has_summary"],
        archetype: archetypeValues.map[json["archetype"]],
        lastPosterUsername: json["last_poster_username"],
        categoryId: json["category_id"],
        pinnedGlobally: json["pinned_globally"],
        featuredLink: json["featured_link"],
        posters:
            List<Poster>.from(json["posters"].map((x) => Poster.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "fancy_title": fancyTitle,
        "slug": slug,
        "posts_count": postsCount,
        "reply_count": replyCount,
        "highest_post_number": highestPostNumber,
        "image_url": imageUrl == null ? null : imageUrl,
        "created_at": createdAt.toIso8601String(),
        "last_posted_at": lastPostedAt.toIso8601String(),
        "bumped": bumped,
        "bumped_at": bumpedAt.toIso8601String(),
        "unseen": unseen,
        "last_read_post_number":
            lastReadPostNumber == null ? null : lastReadPostNumber,
        "unread": unread == null ? null : unread,
        "new_posts": newPosts == null ? null : newPosts,
        "pinned": pinned,
        "unpinned": unpinned,
        "excerpt": excerpt == null ? null : excerpt,
        "visible": visible,
        "closed": closed,
        "archived": archived,
        "notification_level":
            notificationLevel == null ? null : notificationLevel,
        "bookmarked": bookmarked == null ? null : bookmarked,
        "liked": liked == null ? null : liked,
        "views": views,
        "like_count": likeCount,
        "has_summary": hasSummary,
        "archetype": archetypeValues.reverse[archetype],
        "last_poster_username": lastPosterUsername,
        "category_id": categoryId,
        "pinned_globally": pinnedGlobally,
        "featured_link": featuredLink,
        "posters": List<dynamic>.from(posters.map((x) => x.toJson())),
      };
}

enum Archetype { REGULAR }

final archetypeValues = EnumValues({"regular": Archetype.REGULAR});

class Poster {
  Poster({
    this.extras,
    this.description,
    this.userId,
    this.primaryGroupId,
  });

  final Extras extras;
  final Description description;
  final int userId;
  final dynamic primaryGroupId;

  factory Poster.fromJson(Map<String, dynamic> json) => Poster(
        extras:
            json["extras"] == null ? null : extrasValues.map[json["extras"]],
        description: descriptionValues.map[json["description"]],
        userId: json["user_id"],
        primaryGroupId: json["primary_group_id"],
      );

  Map<String, dynamic> toJson() => {
        "extras": extras == null ? null : extrasValues.reverse[extras],
        "description": descriptionValues.reverse[description],
        "user_id": userId,
        "primary_group_id": primaryGroupId,
      };
}

enum Description {
  ORIGINAL_POSTER,
  FREQUENT_POSTER,
  MOST_RECENT_POSTER,
  ORIGINAL_POSTER_MOST_RECENT_POSTER
}

final descriptionValues = EnumValues({
  "Frequent Poster": Description.FREQUENT_POSTER,
  "Most Recent Poster": Description.MOST_RECENT_POSTER,
  "Original Poster": Description.ORIGINAL_POSTER,
  "Original Poster, Most Recent Poster":
      Description.ORIGINAL_POSTER_MOST_RECENT_POSTER
});

enum Extras { LATEST, LATEST_SINGLE }

final extrasValues = EnumValues(
    {"latest": Extras.LATEST, "latest single": Extras.LATEST_SINGLE});

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.avatarTemplate,
  });

  final int id;
  final String username;
  final String name;
  final String avatarTemplate;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        avatarTemplate: json["avatar_template"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "avatar_template": avatarTemplate,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
