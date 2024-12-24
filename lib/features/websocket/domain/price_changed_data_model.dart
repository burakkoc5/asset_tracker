import 'package:asset_tracker/features/websocket/domain/currency.dart';
import 'package:asset_tracker/features/websocket/domain/meta.dart';

class PriceChangedDataModel {
  final Map<String, Currency> data;
  final Meta meta;

  PriceChangedDataModel({
    required this.data,
    required this.meta,
  });

  // JSON verisini modele çevirmek için
  factory PriceChangedDataModel.fromJson(Map<String, dynamic> json) {
    return PriceChangedDataModel(
      data: (json['data'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, Currency.fromJson(value)),
      ),
      meta: Meta.fromJson(json['meta']),
    );
  }

  // Yeni gelen verileri mevcut verilerle güncellemek için
  PriceChangedDataModel updateData(Map<String, Currency> newData) {
    Map<String, Currency> updatedData = Map.from(data);

    // Yalnızca değişen verileri güncelle
    newData.forEach((key, value) {
      if (updatedData.containsKey(key)) {
        updatedData[key] = value; // Currency değişti, güncelle
      }
    });

    return PriceChangedDataModel(
      data: updatedData,
      meta: meta,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((key, value) => MapEntry(key, value.toJson())),
      'meta': meta.toJson(),
    };
  }
}
