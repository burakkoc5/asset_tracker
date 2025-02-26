import 'package:cloud_firestore/cloud_firestore.dart';

class UserAsset {
  String? id;
  String? userId;
  String? type;
  int amount;
  double purchasePrice;
  DateTime? purchaseDate;
  String? createdAt;

  UserAsset({
    this.id,
    this.userId,
    this.type,
    int? amount,
    double? purchasePrice,
    this.purchaseDate,
    this.createdAt,
  })  : amount = amount ?? 0,
        purchasePrice = purchasePrice ?? 0.0;

  UserAsset.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        userId = json['userId'] ?? '',
        type = json['type'] ?? '',
        amount = (json['amount'] as int?) ?? 0,
        purchasePrice = (json['purchasePrice'] as num?)?.toDouble() ?? 0.0,
        purchaseDate = (json['purchaseDate'] as Timestamp).toDate(),
        createdAt = json['createdAt'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',
      'userId': userId ?? '',
      'type': type ?? '',
      'amount': amount,
      'purchasePrice': purchasePrice,
      'purchaseDate': purchaseDate ?? '',
      'createdAt': createdAt ?? '',
    };
  }

  UserAsset copyWith({
    String? id,
    String? userId,
    String? type,
    int? amount,
    double? purchasePrice,
    DateTime? purchaseDate,
    String? createdAt,
  }) {
    return UserAsset(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
