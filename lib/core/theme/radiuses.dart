import 'package:flutter/material.dart';

enum Radiuses {
  /// 4px.
  xxs(4),

  /// 8px.
  xs(8),

  /// 16px.
  sm(16),

  /// 24px.
  md(24),

  /// 32px.
  lg(32),

  /// 48px.
  xl(48),

  /// 56px.
  xxl(56);

  const Radiuses(this.value);

  final double value;

  /// Radius for circular.
  Radius get circular => Radius.circular(value);

  /// Radius for all sides.
  BorderRadius get all => BorderRadius.circular(value);

  /// Radius for a single side.
  BorderRadius only({
    bool topLeft = false,
    bool topRight = false,
    bool bottomLeft = false,
    bool bottomRight = false,
  }) =>
      BorderRadius.only(
        topLeft: topLeft ? circular : Radius.zero,
        topRight: topRight ? circular : Radius.zero,
        bottomLeft: bottomLeft ? circular : Radius.zero,
        bottomRight: bottomRight ? circular : Radius.zero,
      );

  /// Radius for a single side.
  BorderRadius symmetric({
    bool horizontal = false,
    bool vertical = false,
  }) =>
      BorderRadius.only(
        topLeft: vertical ? circular : Radius.zero,
        topRight: vertical ? circular : Radius.zero,
        bottomLeft: horizontal ? circular : Radius.zero,
        bottomRight: horizontal ? circular : Radius.zero,
      );
}
