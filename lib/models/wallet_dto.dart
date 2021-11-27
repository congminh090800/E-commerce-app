import 'package:json_annotation/json_annotation.dart';

part 'wallet_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WalletDTO {
  String? id;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? amount;
  int? bonus;
  bool? isBlocked;

  WalletDTO(this.id, this.userId, this.createdAt, this.updatedAt, this.amount,
      this.bonus, this.isBlocked);
  factory WalletDTO.fromJson(Map<String, dynamic> json) =>
      _$WalletDTOFromJson(json);
  Map<String, dynamic> toJson() => _$WalletDTOToJson(this);
}
