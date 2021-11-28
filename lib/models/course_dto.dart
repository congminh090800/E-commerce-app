import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/category_dto.dart';
import 'package:lettutor/models/topic_dto.dart';

part 'course_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CourseDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  String? imageUrl;
  String? level;
  String? reason;
  String? purpose;
  String? other_details;
  int? default_price;
  int? course_price;
  bool? visible;
  @JsonKey(nullable: true)
  List<CategoryDTO>? categories;
  @JsonKey(nullable: true)
  List<TopicDTO>? topics;

  CourseDTO(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.description,
      this.imageUrl,
      this.level,
      this.reason,
      this.purpose,
      this.other_details,
      this.default_price,
      this.course_price,
      this.visible,
      this.categories,
      this.topics);
  factory CourseDTO.fromJson(Map<String, dynamic> json) =>
      _$CourseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CourseDTOToJson(this);
}
