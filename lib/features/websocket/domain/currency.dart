import 'package:asset_tracker/features/websocket/domain/direction.dart';

class Currency {
  static const Map<String, String> currencyNames = {
    'KULCEALTIN': 'Külçe Altın',
    'ALTIN': 'Altın',
    'CEYREK_ESKI': 'Çeyrek (Eski)',
    'CEYREK_YENI': 'Çeyrek (Yeni)',
    'YARIM_ESKI': 'Yarım (Eski)',
    'YARIM_YENI': 'Yarım (Yeni)',
    'TEK_ESKI': 'Tek (Eski)',
    'TEK_YENI': 'Tek (Yeni)',
    'ATA_ESKI': 'Ata (Eski)',
    'ATA_YENI': 'Ata (Yeni)',
    'AUDTRY': 'Avustralya Doları',
    'AYAR22': '22 Ayar Altın',
    'AYAR24': '24 Ayar Altın',
    'AYAR26': '26 Ayar Altın',
    'AYAR28': '28 Ayar Altın',
    'AYAR30': '30 Ayar Altın',
    'USDTRY': 'Dolar/TL',
    'EURTRY': 'Euro/TL',
    'GBPTRY': 'Sterlin/TL',
    'CHFTRY': 'Frang/TL',
    'SARTRY': 'Riyal/TL',
    'JPYTRY': 'Yen/TL',
    'SEKTRY': 'Sveç Kron/TL',
    'DKKTRY': 'Dansk Kron/TL',
    'NOKTRY': 'Norveç Kron/TL',
    'CADTRY': 'Kanada Doları/TL',
    'USDCAD': 'Dolar/Kanada Doları',
    'XAUXAG': 'Altın/Gram',
    'USDPURE': 'Dolar',
    'USDKG': 'Dolar/Kg',
    'EURKG': 'Euro/Kg',
    'GBPKG': 'Sterlin/Kg',
    'GBPUSD': 'Sterlin/Dolar',
    'GREMESE_ESKI': 'Gremese Altın (Eski)',
    'GREMESE_YENI': 'Gremese Altın (Yeni)',
    'ATA5_ESKI': 'Ata 5 (Eski)',
    'ATA5_YENI': 'Ata 5 (Yeni)',
    'GUMUSTRY': 'Gümüş/TL',
    'XPTUSD': 'Palladyum/Dolar',
    'EURUSD': 'Euro/Dolar',
    'USDJPY': 'Dolar/Yen',
    'XAGUSD': 'Gümüş/Dolar',
    'GUMUSUSD': 'Gümüş/Dolar',
    'XPDUSD': 'Platin/Dolar',
    'XAUUSD': 'Altın/Dolar',
    'USDSAR': 'Dolar/Riyal',
    'AUDUSD': 'Avustralya Doları/Dolar',
    'USDCHF': 'Dolar/Frang',
    'USDCNY': 'Dolar/Çin Yuan',
    'USDMXN': 'Dolar/Meksika Peso',
    'USDPHP': 'Dolar/Filipin Peso',
    'USDMYR': 'Dolar/Malezya Ringgit',
  };

  final String code;
  final String alis;
  final String satis;
  final String tarih;
  final Direction dir;
  final String dusuk;
  final String yuksek;
  final String kapanis;

  Currency({
    required this.code,
    required this.alis,
    required this.satis,
    required this.tarih,
    required this.dir,
    required this.dusuk,
    required this.yuksek,
    required this.kapanis,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'].toString(),
      alis: json['alis'].toString(),
      satis: json['satis'].toString(),
      tarih: json['tarih'].toString(),
      dir: Direction.fromJson(json['dir']),
      dusuk: json['dusuk'].toString(),
      yuksek: json['yuksek'].toString(),
      kapanis: json['kapanis'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'alis': alis,
      'satis': satis,
      'tarih': tarih,
      'dir': dir.toJson(),
      'dusuk': dusuk,
      'yuksek': yuksek,
      'kapanis': kapanis,
    };
  }
}
