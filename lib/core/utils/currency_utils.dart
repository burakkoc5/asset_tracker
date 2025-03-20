import 'package:flutter/material.dart';
import 'package:asset_tracker/i18n/strings.g.dart';

/// Para birimleri ve finansal varlıklarla ilgili yardımcı fonksiyonlar içeren utility sınıfı.
class CurrencyUtils {
  /// Tüm para birimi ve varlık türlerinin çevirilmiş isimlerini döndürür
  static Map<String, String> get getLocalizedNames {
    // Create a new map each time this is called to ensure fresh translations
    // This way, when the app language changes, this will return current translations
    return {
      'KULCEALTIN': t.currency.names.KULCEALTIN,
      'ALTIN': t.currency.names.ALTIN,
      'CEYREK_ESKI': t.currency.names.CEYREK_ESKI,
      'CEYREK_YENI': t.currency.names.CEYREK_YENI,
      'YARIM_ESKI': t.currency.names.YARIM_ESKI,
      'YARIM_YENI': t.currency.names.YARIM_YENI,
      'TEK_ESKI': t.currency.names.TEK_ESKI,
      'TEK_YENI': t.currency.names.TEK_YENI,
      'ATA_ESKI': t.currency.names.ATA_ESKI,
      'ATA_YENI': t.currency.names.ATA_YENI,
      'AUDTRY': t.currency.names.AUDTRY,
      'AYAR22': t.currency.names.AYAR22,
      'AYAR24': t.currency.names.AYAR24,
      'AYAR26': t.currency.names.AYAR26,
      'AYAR28': t.currency.names.AYAR28,
      'AYAR30': t.currency.names.AYAR30,
      'USDTRY': t.currency.names.USDTRY,
      'EURTRY': t.currency.names.EURTRY,
      'GBPTRY': t.currency.names.GBPTRY,
      'CHFTRY': t.currency.names.CHFTRY,
      'SARTRY': t.currency.names.SARTRY,
      'JPYTRY': t.currency.names.JPYTRY,
      'SEKTRY': t.currency.names.SEKTRY,
      'DKKTRY': t.currency.names.DKKTRY,
      'NOKTRY': t.currency.names.NOKTRY,
      'CADTRY': t.currency.names.CADTRY,
      'USDCAD': t.currency.names.USDCAD,
      'XAUXAG': t.currency.names.XAUXAG,
      'USDPURE': t.currency.names.USDPURE,
      'USDKG': t.currency.names.USDKG,
      'EURKG': t.currency.names.EURKG,
      'GBPKG': t.currency.names.GBPKG,
      'GBPUSD': t.currency.names.GBPUSD,
      'GREMESE_ESKI': t.currency.names.GREMESE_ESKI,
      'GREMESE_YENI': t.currency.names.GREMESE_YENI,
      'ATA5_ESKI': t.currency.names.ATA5_ESKI,
      'ATA5_YENI': t.currency.names.ATA5_YENI,
      'GUMUSTRY': t.currency.names.GUMUSTRY,
      'XPTUSD': t.currency.names.XPTUSD,
      'EURUSD': t.currency.names.EURUSD,
      'USDJPY': t.currency.names.USDJPY,
      'XAGUSD': t.currency.names.XAGUSD,
      'GUMUSUSD': t.currency.names.GUMUSUSD,
      'XPDUSD': t.currency.names.XPDUSD,
      'XAUUSD': t.currency.names.XAUUSD,
      'USDSAR': t.currency.names.USDSAR,
      'AUDUSD': t.currency.names.AUDUSD,
      'USDCHF': t.currency.names.USDCHF,
      'USDCNY': t.currency.names.USDCNY,
      'USDMXN': t.currency.names.USDMXN,
      'USDPHP': t.currency.names.USDPHP,
      'USDMYR': t.currency.names.USDMYR,
    };
  }

  /// Verilen kod için yerelleştirilmiş ismi döndürür
  static String getLocalizedName(String? code) {
    if (code == null || code.isEmpty) {
      return '';
    }

    // Directly access the translation instead of using the cached map
    // This ensures we always get the most current translation when language changes
    switch (code) {
      case 'KULCEALTIN':
        return t.currency.names.KULCEALTIN;
      case 'ALTIN':
        return t.currency.names.ALTIN;
      case 'CEYREK_ESKI':
        return t.currency.names.CEYREK_ESKI;
      case 'CEYREK_YENI':
        return t.currency.names.CEYREK_YENI;
      case 'YARIM_ESKI':
        return t.currency.names.YARIM_ESKI;
      case 'YARIM_YENI':
        return t.currency.names.YARIM_YENI;
      case 'TEK_ESKI':
        return t.currency.names.TEK_ESKI;
      case 'TEK_YENI':
        return t.currency.names.TEK_YENI;
      case 'ATA_ESKI':
        return t.currency.names.ATA_ESKI;
      case 'ATA_YENI':
        return t.currency.names.ATA_YENI;
      case 'AUDTRY':
        return t.currency.names.AUDTRY;
      case 'AYAR22':
        return t.currency.names.AYAR22;
      case 'AYAR24':
        return t.currency.names.AYAR24;
      case 'AYAR26':
        return t.currency.names.AYAR26;
      case 'AYAR28':
        return t.currency.names.AYAR28;
      case 'AYAR30':
        return t.currency.names.AYAR30;
      case 'USDTRY':
        return t.currency.names.USDTRY;
      case 'EURTRY':
        return t.currency.names.EURTRY;
      case 'GBPTRY':
        return t.currency.names.GBPTRY;
      case 'CHFTRY':
        return t.currency.names.CHFTRY;
      case 'SARTRY':
        return t.currency.names.SARTRY;
      case 'JPYTRY':
        return t.currency.names.JPYTRY;
      case 'SEKTRY':
        return t.currency.names.SEKTRY;
      case 'DKKTRY':
        return t.currency.names.DKKTRY;
      case 'NOKTRY':
        return t.currency.names.NOKTRY;
      case 'CADTRY':
        return t.currency.names.CADTRY;
      case 'USDCAD':
        return t.currency.names.USDCAD;
      case 'XAUXAG':
        return t.currency.names.XAUXAG;
      case 'USDPURE':
        return t.currency.names.USDPURE;
      case 'USDKG':
        return t.currency.names.USDKG;
      case 'EURKG':
        return t.currency.names.EURKG;
      case 'GBPKG':
        return t.currency.names.GBPKG;
      case 'GBPUSD':
        return t.currency.names.GBPUSD;
      case 'GREMESE_ESKI':
        return t.currency.names.GREMESE_ESKI;
      case 'GREMESE_YENI':
        return t.currency.names.GREMESE_YENI;
      case 'ATA5_ESKI':
        return t.currency.names.ATA5_ESKI;
      case 'ATA5_YENI':
        return t.currency.names.ATA5_YENI;
      case 'GUMUSTRY':
        return t.currency.names.GUMUSTRY;
      case 'XPTUSD':
        return t.currency.names.XPTUSD;
      case 'EURUSD':
        return t.currency.names.EURUSD;
      case 'USDJPY':
        return t.currency.names.USDJPY;
      case 'XAGUSD':
        return t.currency.names.XAGUSD;
      case 'GUMUSUSD':
        return t.currency.names.GUMUSUSD;
      case 'XPDUSD':
        return t.currency.names.XPDUSD;
      case 'XAUUSD':
        return t.currency.names.XAUUSD;
      case 'USDSAR':
        return t.currency.names.USDSAR;
      case 'AUDUSD':
        return t.currency.names.AUDUSD;
      case 'USDCHF':
        return t.currency.names.USDCHF;
      case 'USDCNY':
        return t.currency.names.USDCNY;
      case 'USDMXN':
        return t.currency.names.USDMXN;
      case 'USDPHP':
        return t.currency.names.USDPHP;
      case 'USDMYR':
        return t.currency.names.USDMYR;
      default:
        return code;
    }
  }

  /// Para birimi koduna göre uygun ikon data'sını döndürür.
  static IconData getCurrencyIconData(String code) {
    if (code.contains('USD') || code.contains('DOLAR')) {
      return Icons.attach_money;
    } else if (code.contains('EUR')) {
      return Icons.euro;
    } else if (code.contains('GBP') || code.contains('STERLIN')) {
      return Icons.currency_pound;
    } else if (code.contains('ALTIN') ||
        code.contains('GOLD') ||
        code.contains('XAU') ||
        code.contains('ATA') ||
        code.contains('CEYREK') ||
        code.contains('YARIM') ||
        code.contains('TEK') ||
        code.contains('GREMESE')) {
      return Icons.monetization_on;
    } else if (code.contains('GUMUS') || code.contains('XAG')) {
      return Icons.workspaces_outline;
    } else {
      return Icons.account_balance;
    }
  }

  /// Verilen para birimi kodunun satın alınabilir bir varlık olup olmadığını kontrol eder.
  static bool isPurchasableAsset(String code) {
    bool isPurchasable = true;

    // Kur oranı kontrolü (X/Y formatı)
    if (code.contains('USD') && code != 'USDTRY' && code != 'USDPURE') {
      isPurchasable = false;
    }
    if (code.contains('EUR') && code != 'EURTRY') {
      isPurchasable = false;
    }
    if (code.contains('GBP') && code != 'GBPTRY') {
      isPurchasable = false;
    }
    if (code.contains('XAU') ||
        code.contains('XAG') ||
        code.contains('XPT') ||
        code.contains('XPD')) {
      isPurchasable = false;
    }

    return isPurchasable;
  }

  /// Sadece satın alınabilir varlıkların listesini döndürür.
  static Map<String, String> filterPurchasableAssets(
      Map<String, String> allAssets) {
    final Map<String, String> purchasableAssets = {};

    allAssets.forEach((key, value) {
      if (isPurchasableAsset(key)) {
        purchasableAssets[key] = value;
      }
    });

    return purchasableAssets;
  }
}
