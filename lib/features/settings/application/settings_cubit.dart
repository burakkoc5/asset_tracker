import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/settings/domain/app_settings.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<AppSettings> {
  final SharedPreferences _prefs;

  // Shared Preferences anahtar sabitleri
  static const String _themeModeKey = 'theme_mode';
  static const String _localeKey = 'locale';

  SettingsCubit(this._prefs) : super(const AppSettings()) {
    _loadSettings();
  }

  // Kayıtlı ayarları yükler
  Future<void> _loadSettings() async {
    try {
      final themeMode = _getThemeMode();
      final locale = _getLocale();

      final settings = AppSettings(
        themeMode: themeMode,
        locale: locale,
      );

      emit(settings);
      _applySettings(settings);
    } catch (e) {
      debugPrint('Error loading settings: $e');
      // Emit default settings in case of error
      emit(const AppSettings());
    }
  }

  // Tema modunu değiştirir
  void setThemeMode(ThemeMode themeMode) {
    try {
      final settings = state.copyWith(themeMode: themeMode);
      _prefs.setInt(_themeModeKey, themeMode.index);
      emit(settings);
      _applySettings(settings);
    } catch (e) {
      debugPrint('Error setting theme mode: $e');
    }
  }

  // Dili değiştirir
  void setLocale(AppLocale locale) {
    try {
      final settings = state.copyWith(locale: locale);
      _prefs.setString(_localeKey, locale.languageCode);
      LocaleSettings.setLocale(locale);
      emit(settings);
      _applySettings(settings);
    } catch (e) {
      debugPrint('Error setting locale: $e');
    }
  }

  // Ayarları uygular
  void _applySettings(AppSettings settings) {
    settings.applySystemUI();
  }

  // Kayıtlı tema modunu alır
  ThemeMode _getThemeMode() {
    try {
      final themeModeIndex = _prefs.getInt(_themeModeKey);
      if (themeModeIndex == null) return ThemeMode.system;
      return ThemeMode.values[themeModeIndex];
    } catch (e) {
      debugPrint('Error getting theme mode: $e');
      return ThemeMode.system;
    }
  }

  // Kayıtlı dili alır
  AppLocale _getLocale() {
    try {
      final localeCode = _prefs.getString(_localeKey);
      if (localeCode == null) return AppLocale.tr;

      return AppLocale.values.firstWhere(
        (locale) => locale.languageCode == localeCode,
        orElse: () => AppLocale.tr,
      );
    } catch (e) {
      debugPrint('Error getting locale: $e');
      return AppLocale.tr;
    }
  }
}
