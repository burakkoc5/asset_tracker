import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:asset_tracker/core/theme/theme.dart';

class AppSettings {
  final ThemeMode themeMode;
  final AppLocale locale;

  const AppSettings({
    this.themeMode = ThemeMode.system,
    this.locale = AppLocale.tr,
  });

  AppSettings copyWith({
    ThemeMode? themeMode,
    AppLocale? locale,
  }) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  // Sistemin tema modunu ayarlar
  void applySystemUI() {
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: isDark
            ? MaterialTheme.darkScheme().surface
            : MaterialTheme.lightScheme().surface,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }
}
