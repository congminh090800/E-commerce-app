import 'package:json_annotation/json_annotation.dart';

part 'topic_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TopicDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? courseId;
  int? orderCourse;
  String? name;
  String? description;
  String? videoUrl;

  TopicDTO(this.id, this.createdAt, this.updatedAt, this.courseId,
      this.orderCourse, this.name, this.description, this.videoUrl);
  factory TopicDTO.fromJson(Map<String, dynamic> json) =>
      _$TopicDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TopicDTOToJson(this);
}
