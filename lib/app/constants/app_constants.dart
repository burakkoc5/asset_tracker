class AppConstants {
  AppConstants._();

  /// App Registration Constants

  /// Email Regex
  /// [email]@[domain].[tld]
  static const emailRegex = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$';

  /// Password Min Length
  /// 6
  static const int passwordMinLength = 6;

  /// App Logo Sizes
  /// 50px - xSmall
  static const double appLogoSizeXSmall = 50;

  /// 100px - Small
  static const double appLogoSizeSmall = 100;

  /// 150px - Medium
  static const double appLogoSizeMedium = 150;

  /// 200px - Large
  static const double appLogoSizeLarge = 200;

  /// 250px - xLarge
  static const double appLogoSizeXLarge = 250;

  /// App Durations
  /// 100ms - Short
  static const Duration appDurationShort = Duration(milliseconds: 100);

  /// 500ms - Medium
  static const Duration appDurationMedium = Duration(milliseconds: 500);

  /// 1s - Long
  static const Duration appDurationLong = Duration(seconds: 1);

  /// 3s - Extra Long
  static const Duration appDurationExtraLong = Duration(seconds: 3);

  /// App Icon Size Constants
  static const double iconSizeSmall = 16;
  static const double iconSizeMedium = 24;
  static const double iconSizeLarge = 32;
  static const double iconSizeXLarge = 48;
}
