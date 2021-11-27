import 'package:json_annotation/json_annotation.dart';

part 'price_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PriceDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? key;
  String? price;

  PriceDTO(this.id, this.createdAt, this.updatedAt, this.key, this.price);
  factory PriceDTO.fromJson(Map<String, dynamic> json) =>
      _$PriceDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PriceDTOToJson(this);
}
