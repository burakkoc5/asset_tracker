import 'package:asset_tracker/features/websocket/domain/direction.dart';
import 'package:asset_tracker/features/websocket/domain/currency_names.dart';

class Currency {
  static Map<String, String> get currencyNames => CurrencyNames.names;

  final String code;
  final String buy;
  final String sell;
  final String date;
  final Direction dir;
  final String low;
  final String high;
  final String close;

  Currency({
    required this.code,
    required this.buy,
    required this.sell,
    required this.date,
    required this.dir,
    required this.low,
    required this.high,
    required this.close,
  });

  factory Currency.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('Currency.fromJson: json cannot be null');
    }

    return Currency(
      code: json['code']?.toString() ?? '',
      buy: json['alis']?.toString() ?? '0',
      sell: json['satis']?.toString() ?? '0',
      date: json['tarih']?.toString() ?? '',
      dir: Direction.fromJson(json['dir']),
      low: json['dusuk']?.toString() ?? '0',
      high: json['yuksek']?.toString() ?? '0',
      close: json['kapanis']?.toString() ?? '0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'alis': buy,
      'satis': sell,
      'tarih': date,
      'dir': dir.toJson(),
      'dusuk': low,
      'yuksek': high,
      'kapanis': close,
    };
  }
}
