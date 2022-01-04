import 'package:json_annotation/json_annotation.dart';

part 'price.g.dart';

@JsonSerializable(explicitToJson: true)
class Price {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? price;
  String? key;

  Price();
  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
