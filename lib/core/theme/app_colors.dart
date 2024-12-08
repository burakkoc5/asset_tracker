import 'package:flutter/material.dart';

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  static const primarySwatch = MaterialColor(
    0xFF000000, //0
    {
      0: Color(0xFF000000),
      10: Color(0xFF04527E),
      20: Color(0xFF016697),
      30: Color(0xFF1884BD),
      40: Color(0xFF38A5EB),
      50: Color(0xFF55B3F3),
      60: Color(0xFF76CFFF),
      70: Color(0xFF99DBFF),
      80: Color(0xFFB3E4FF),
      90: Color(0xFFCCEDFF),
      95: Color(0xFFECF8FF),
      99: Color(0xFFF9FDFF),
      100: Color(0xFFFFFFFF),
    },
  );

  static const greenSwatch = MaterialColor(
    0xFF000000, //0
    {
      0: Color(0xFF000000),
      10: Color(0xFF258260),
      20: Color(0xFF33AB7F),
      30: Color(0xFF3EC895),
      40: Color(0xFF42CD9A),
      50: Color(0xFF40DBA3),
      60: Color(0xFF9FEDD1),
      70: Color(0xFFB3F1DA),
      80: Color(0xFFC5F4E3),
      90: Color(0xFFD9F8ED),
      95: Color(0xFFEBFBF5),
      99: Color(0xFFF8FFFC),
      100: Color(0xFFFFFFFF),
    },
  );

  static const neutralSwatch = MaterialColor(
    0xFF000000, //0
    {
      0: Color(0xFF000000),
      10: Color(0xFF1B1C1F),
      20: Color(0xFF303133),
      30: Color(0xFF464749),
      40: Color(0xFF5D5F62),
      50: Color(0xFF757679),
      60: Color(0xFF909294),
      70: Color(0xFFAAACAE),
      80: Color(0xFFC5C9CA),
      90: Color(0xFFE1E5E6),
      95: Color(0xFFF3F5F6),
      99: Color(0xFFF8F8F8),
      100: Color(0xFFFFFFFF),
    },
  );

  static final primary = primarySwatch[50]!;
  static final onPrimary = primarySwatch[100]!;
  static final primaryContainer = primarySwatch[90]!;
  static final onPrimaryContainer = primarySwatch[10]!;

  static const error = Color(0xFFE02A2A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFF9DEDC);
  static const onErrorContainer = Color(0xFF410E0B);
  static const divider = Color(0x33494949);

  static final background = neutralSwatch[95]!;
  static final onBackground = neutralSwatch[20]!;

  static final surface = neutralSwatch[100]!;
  static final onSurface = neutralSwatch[20]!;
  static final surfaceVariant = neutralSwatch[95]!;
  static final onSurfaceVariant = neutralSwatch[30]!;
  static final outline = neutralSwatch[50]!;
  static final outlineVariant = neutralSwatch[80]!;

  static final textColor = onSurface;
  static final iconBackgroundColor = neutralSwatch[90]!;

  static final green = greenSwatch[50]!;
  static const red = Color(0xFFE02A2A);
}
