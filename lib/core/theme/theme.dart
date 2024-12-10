import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff565992),
      surfaceTint: Color(0xff565992),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe0e0ff),
      onPrimaryContainer: Color(0xff11144b),
      secondary: Color(0xff5c5d72),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe1e0f9),
      onSecondaryContainer: Color(0xff191a2c),
      tertiary: Color(0xff78536b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd8ee),
      onTertiaryContainer: Color(0xff2e1126),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff46464f),
      outline: Color(0xff777680),
      outlineVariant: Color(0xffc7c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffbfc2ff),
      primaryFixed: Color(0xffe0e0ff),
      onPrimaryFixed: Color(0xff11144b),
      primaryFixedDim: Color(0xffbfc2ff),
      onPrimaryFixedVariant: Color(0xff3e4278),
      secondaryFixed: Color(0xffe1e0f9),
      onSecondaryFixed: Color(0xff191a2c),
      secondaryFixedDim: Color(0xffc5c4dd),
      onSecondaryFixedVariant: Color(0xff444559),
      tertiaryFixed: Color(0xffffd8ee),
      onTertiaryFixed: Color(0xff2e1126),
      tertiaryFixedDim: Color(0xffe8b9d5),
      onTertiaryFixedVariant: Color(0xff5e3c52),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3a3e74),
      surfaceTint: Color(0xff565992),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6c70aa),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff404155),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff727389),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5a384e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff906981),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff42424b),
      outline: Color(0xff5f5e67),
      outlineVariant: Color(0xff7b7a83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffbfc2ff),
      primaryFixed: Color(0xff6c70aa),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff53578f),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff727389),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5a5a6f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff906981),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff765168),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff181c51),
      surfaceTint: Color(0xff565992),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff3a3e74),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff202133),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff404155),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff36182d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5a384e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff23232b),
      outline: Color(0xff42424b),
      outlineVariant: Color(0xff42424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffeceaff),
      primaryFixed: Color(0xff3a3e74),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff23275d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff404155),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2a2b3e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5a384e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff412237),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffeae7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbfc2ff),
      surfaceTint: Color(0xffbfc2ff),
      onPrimary: Color(0xff272b60),
      primaryContainer: Color(0xff3e4278),
      onPrimaryContainer: Color(0xffe0e0ff),
      secondary: Color(0xffc5c4dd),
      onSecondary: Color(0xff2e2f42),
      secondaryContainer: Color(0xff444559),
      onSecondaryContainer: Color(0xffe1e0f9),
      tertiary: Color(0xffe8b9d5),
      onTertiary: Color(0xff46263b),
      tertiaryContainer: Color(0xff5e3c52),
      onTertiaryContainer: Color(0xffffd8ee),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131318),
      onSurface: Color(0xffe4e1e9),
      onSurfaceVariant: Color(0xffc7c5d0),
      outline: Color(0xff918f9a),
      outlineVariant: Color(0xff46464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inversePrimary: Color(0xff565992),
      primaryFixed: Color(0xffe0e0ff),
      onPrimaryFixed: Color(0xff11144b),
      primaryFixedDim: Color(0xffbfc2ff),
      onPrimaryFixedVariant: Color(0xff3e4278),
      secondaryFixed: Color(0xffe1e0f9),
      onSecondaryFixed: Color(0xff191a2c),
      secondaryFixedDim: Color(0xffc5c4dd),
      onSecondaryFixedVariant: Color(0xff444559),
      tertiaryFixed: Color(0xffffd8ee),
      onTertiaryFixed: Color(0xff2e1126),
      tertiaryFixedDim: Color(0xffe8b9d5),
      onTertiaryFixedVariant: Color(0xff5e3c52),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39393f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc4c6ff),
      surfaceTint: Color(0xffbfc2ff),
      onPrimary: Color(0xff0b0e46),
      primaryContainer: Color(0xff888cc8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc9c9e1),
      onSecondary: Color(0xff141526),
      secondaryContainer: Color(0xff8f8fa6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffecbdd9),
      onTertiary: Color(0xff280c20),
      tertiaryContainer: Color(0xffae849e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xfffdf9ff),
      onSurfaceVariant: Color(0xffccc9d4),
      outline: Color(0xffa3a2ac),
      outlineVariant: Color(0xff83828c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inversePrimary: Color(0xff3f437a),
      primaryFixed: Color(0xffe0e0ff),
      onPrimaryFixed: Color(0xff050741),
      primaryFixedDim: Color(0xffbfc2ff),
      onPrimaryFixedVariant: Color(0xff2d3167),
      secondaryFixed: Color(0xffe1e0f9),
      onSecondaryFixed: Color(0xff0e1021),
      secondaryFixedDim: Color(0xffc5c4dd),
      onSecondaryFixedVariant: Color(0xff343548),
      tertiaryFixed: Color(0xffffd8ee),
      onTertiaryFixed: Color(0xff22071b),
      tertiaryFixedDim: Color(0xffe8b9d5),
      onTertiaryFixedVariant: Color(0xff4c2c41),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39393f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdf9ff),
      surfaceTint: Color(0xffbfc2ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc4c6ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdf9ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc9c9e1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffecbdd9),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffdf9ff),
      outline: Color(0xffccc9d4),
      outlineVariant: Color(0xffccc9d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inversePrimary: Color(0xff20245a),
      primaryFixed: Color(0xffe5e4ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc4c6ff),
      onPrimaryFixedVariant: Color(0xff0b0e46),
      secondaryFixed: Color(0xffe6e4fe),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc9c9e1),
      onSecondaryFixedVariant: Color(0xff141526),
      tertiaryFixed: Color(0xffffdef0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffecbdd9),
      onTertiaryFixedVariant: Color(0xff280c20),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39393f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
