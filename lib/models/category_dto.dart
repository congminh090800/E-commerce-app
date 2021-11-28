import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CategoryDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? description;
  String? key;

  CategoryDTO(this.id, this.createdAt, this.updatedAt, this.title,
      this.description, this.key);
  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDTOToJson(this);
}
