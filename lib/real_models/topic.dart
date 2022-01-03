import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable(explicitToJson: true)
class Topic {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? courseId;
  int? orderCourse;
  String? name;
  String? description;
  String? videoUrl;

  Topic();
  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);
  Map<String, dynamic> toJson() => _$TopicToJson(this);
}
