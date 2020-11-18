import 'dart:convert';

CreateTopictResponse createTopictResponseFromJson(String str) =>
    CreateTopictResponse.fromJson(json.decode(str));

String createTopictResponseToJson(CreateTopictResponse data) =>
    json.encode(data.toJson());

class CreateTopictResponse {
  CreateTopictResponse({
    this.title,
    this.topicId,
    this.raw,
    this.category,
    this.targetRecipients,
    this.archetype,
    this.createdAt,
  });

  String title;
  int topicId;
  String raw;
  int category;
  String targetRecipients;
  String archetype;
  DateTime createdAt;

  factory CreateTopictResponse.fromJson(Map<String, dynamic> json) =>
      CreateTopictResponse(
        title: json["title"],
        topicId: json["topic_id"],
        raw: json["raw"],
        category: json["category"],
        targetRecipients: json["target_recipients"],
        archetype: json["archetype"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "topic_id": topicId,
        "raw": raw,
        "category": category,
        "target_recipients": targetRecipients,
        "archetype": archetype,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
      };
}
