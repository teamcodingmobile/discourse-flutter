// To parse this JSON data, do
//
//     final userDetailResponse = userDetailResponseFromJson(jsonString);

import 'dart:convert';

UserDetailResponse userDetailResponseFromJson(String str) =>
    UserDetailResponse.fromJson(json.decode(str));

String userDetailResponseToJson(UserDetailResponse data) =>
    json.encode(data.toJson());

class UserDetailResponse {
  UserDetailResponse({
    this.userBadges,
    this.user,
  });

  List<CardBadge> userBadges;
  User user;

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      UserDetailResponse(
        userBadges: List<CardBadge>.from(
            json["user_badges"].map((x) => CardBadge.fromJson(x))),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user_badges": List<dynamic>.from(userBadges.map((x) => x.toJson())),
        "user": user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.username,
    this.avatarTemplate,
    this.name,
    this.lastPostedAt,
    this.lastSeenAt,
    this.createdAt,
    this.websiteName,
    this.canEdit,
    this.canEditUsername,
    this.canEditEmail,
    this.canEditName,
    this.canSendPrivateMessages,
    this.canSendPrivateMessageToUser,
    this.trustLevel,
    this.moderator,
    this.admin,
    this.title,
    this.uploadedAvatarId,
    this.badgeCount,
    this.customFields,
    this.pendingCount,
    this.profileViewCount,
    this.primaryGroupName,
    this.primaryGroupFlairUrl,
    this.primaryGroupFlairBgColor,
    this.primaryGroupFlairColor,
    this.invitedBy,
    this.groups,
    this.featuredUserBadgeIds,
    this.cardBadge,
  });

  int id;
  String username;
  String avatarTemplate;
  CardBadge name;
  String lastPostedAt;
  String lastSeenAt;
  String createdAt;
  CardBadge websiteName;
  bool canEdit;
  bool canEditUsername;
  bool canEditEmail;
  bool canEditName;
  bool canSendPrivateMessages;
  bool canSendPrivateMessageToUser;
  int trustLevel;
  bool moderator;
  bool admin;
  CardBadge title;
  CardBadge uploadedAvatarId;
  int badgeCount;
  CardBadge customFields;
  int pendingCount;
  int profileViewCount;
  CardBadge primaryGroupName;
  CardBadge primaryGroupFlairUrl;
  CardBadge primaryGroupFlairBgColor;
  CardBadge primaryGroupFlairColor;
  CardBadge invitedBy;
  List<Group> groups;
  List<CardBadge> featuredUserBadgeIds;
  CardBadge cardBadge;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        avatarTemplate: json["avatar_template"],
        name: CardBadge.fromJson(json["name"]),
        lastPostedAt: json["last_posted_at"],
        lastSeenAt: json["last_seen_at"],
        createdAt: json["created_at"],
        websiteName: CardBadge.fromJson(json["website_name"]),
        canEdit: json["can_edit"],
        canEditUsername: json["can_edit_username"],
        canEditEmail: json["can_edit_email"],
        canEditName: json["can_edit_name"],
        canSendPrivateMessages: json["can_send_private_messages"],
        canSendPrivateMessageToUser: json["can_send_private_message_to_user"],
        trustLevel: json["trust_level"],
        moderator: json["moderator"],
        admin: json["admin"],
        title: CardBadge.fromJson(json["title"]),
        uploadedAvatarId: CardBadge.fromJson(json["uploaded_avatar_id"]),
        badgeCount: json["badge_count"],
        customFields: CardBadge.fromJson(json["custom_fields"]),
        pendingCount: json["pending_count"],
        profileViewCount: json["profile_view_count"],
        primaryGroupName: CardBadge.fromJson(json["primary_group_name"]),
        primaryGroupFlairUrl:
            CardBadge.fromJson(json["primary_group_flair_url"]),
        primaryGroupFlairBgColor:
            CardBadge.fromJson(json["primary_group_flair_bg_color"]),
        primaryGroupFlairColor:
            CardBadge.fromJson(json["primary_group_flair_color"]),
        invitedBy: CardBadge.fromJson(json["invited_by"]),
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        featuredUserBadgeIds: List<CardBadge>.from(
            json["featured_user_badge_ids"].map((x) => CardBadge.fromJson(x))),
        cardBadge: CardBadge.fromJson(json["card_badge"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "avatar_template": avatarTemplate,
        "name": name.toJson(),
        "last_posted_at": lastPostedAt,
        "last_seen_at": lastSeenAt,
        "created_at": createdAt,
        "website_name": websiteName.toJson(),
        "can_edit": canEdit,
        "can_edit_username": canEditUsername,
        "can_edit_email": canEditEmail,
        "can_edit_name": canEditName,
        "can_send_private_messages": canSendPrivateMessages,
        "can_send_private_message_to_user": canSendPrivateMessageToUser,
        "trust_level": trustLevel,
        "moderator": moderator,
        "admin": admin,
        "title": title.toJson(),
        "uploaded_avatar_id": uploadedAvatarId.toJson(),
        "badge_count": badgeCount,
        "custom_fields": customFields.toJson(),
        "pending_count": pendingCount,
        "profile_view_count": profileViewCount,
        "primary_group_name": primaryGroupName.toJson(),
        "primary_group_flair_url": primaryGroupFlairUrl.toJson(),
        "primary_group_flair_bg_color": primaryGroupFlairBgColor.toJson(),
        "primary_group_flair_color": primaryGroupFlairColor.toJson(),
        "invited_by": invitedBy.toJson(),
        "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
        "featured_user_badge_ids":
            List<dynamic>.from(featuredUserBadgeIds.map((x) => x.toJson())),
        "card_badge": cardBadge.toJson(),
      };
}

class CardBadge {
  CardBadge();

  factory CardBadge.fromJson(Map<String, dynamic> json) => CardBadge();

  Map<String, dynamic> toJson() => {};
}

class Group {
  Group({
    this.id,
    this.automatic,
    this.name,
    this.userCount,
    this.aliasLevel,
    this.visible,
    this.automaticMembershipEmailDomains,
    this.automaticMembershipRetroactive,
    this.primaryGroup,
    this.title,
    this.grantTrustLevel,
    this.notificationLevel,
    this.hasMessages,
    this.isMember,
    this.mentionable,
    this.flairUrl,
    this.flairBgColor,
    this.flairColor,
  });

  int id;
  bool automatic;
  String name;
  int userCount;
  int aliasLevel;
  bool visible;
  CardBadge automaticMembershipEmailDomains;
  bool automaticMembershipRetroactive;
  bool primaryGroup;
  CardBadge title;
  CardBadge grantTrustLevel;
  CardBadge notificationLevel;
  bool hasMessages;
  bool isMember;
  bool mentionable;
  CardBadge flairUrl;
  CardBadge flairBgColor;
  CardBadge flairColor;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        automatic: json["automatic"],
        name: json["name"],
        userCount: json["user_count"],
        aliasLevel: json["alias_level"],
        visible: json["visible"],
        automaticMembershipEmailDomains:
            CardBadge.fromJson(json["automatic_membership_email_domains"]),
        automaticMembershipRetroactive:
            json["automatic_membership_retroactive"],
        primaryGroup: json["primary_group"],
        title: CardBadge.fromJson(json["title"]),
        grantTrustLevel: CardBadge.fromJson(json["grant_trust_level"]),
        notificationLevel: CardBadge.fromJson(json["notification_level"]),
        hasMessages: json["has_messages"],
        isMember: json["is_member"],
        mentionable: json["mentionable"],
        flairUrl: CardBadge.fromJson(json["flair_url"]),
        flairBgColor: CardBadge.fromJson(json["flair_bg_color"]),
        flairColor: CardBadge.fromJson(json["flair_color"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "automatic": automatic,
        "name": name,
        "user_count": userCount,
        "alias_level": aliasLevel,
        "visible": visible,
        "automatic_membership_email_domains":
            automaticMembershipEmailDomains.toJson(),
        "automatic_membership_retroactive": automaticMembershipRetroactive,
        "primary_group": primaryGroup,
        "title": title.toJson(),
        "grant_trust_level": grantTrustLevel.toJson(),
        "notification_level": notificationLevel.toJson(),
        "has_messages": hasMessages,
        "is_member": isMember,
        "mentionable": mentionable,
        "flair_url": flairUrl.toJson(),
        "flair_bg_color": flairBgColor.toJson(),
        "flair_color": flairColor.toJson(),
      };
}
