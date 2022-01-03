import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/category.dart';
import 'package:lettutor/real_models/topic.dart';

part 'course.g.dart';

@JsonSerializable(explicitToJson: true)
class Course {
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
  List<Category>? categories;
  @JsonKey(nullable: true)
  List<Topic>? topics;

  Course();
  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
