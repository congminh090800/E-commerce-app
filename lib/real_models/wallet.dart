import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable(explicitToJson: true)
class Wallet {
  String? id;
  String? userId;
  String? amount;
  bool? isBlocked;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? bonus;
  Wallet();
  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
  Map<String, dynamic> toJson() => _$WalletToJson(this);
}
