import 'package:flutter/material.dart';

@immutable
class CustomAppColors extends ThemeExtension<CustomAppColors> {
  final Color success;
  final Color error;
  final Color warning;
  final Color transparent;
  final Color white;
  final List<Color> chartColors;

  const CustomAppColors({
    required this.success,
    required this.error,
    required this.warning,
    required this.transparent,
    required this.white,
    required this.chartColors,
  });

  @override
  CustomAppColors copyWith({
    Color? success,
    Color? error,
    Color? warning,
    Color? transparent,
    Color? white,
    List<Color>? chartColors,
  }) {
    return CustomAppColors(
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      transparent: transparent ?? this.transparent,
      white: white ?? this.white,
      chartColors: chartColors ?? this.chartColors,
    );
  }

  @override
  ThemeExtension<CustomAppColors> lerp(
      ThemeExtension<CustomAppColors>? other, double t) {
    if (other is! CustomAppColors) {
      return this;
    }
    return CustomAppColors(
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      transparent: Color.lerp(transparent, other.transparent, t)!,
      white: Color.lerp(white, other.white, t)!,
      chartColors: List<Color>.generate(
        chartColors.length,
        (index) => Color.lerp(chartColors[index], other.chartColors[index], t)!,
      ),
    );
  }
}
