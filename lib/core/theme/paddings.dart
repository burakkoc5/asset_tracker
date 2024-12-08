import 'package:flutter/material.dart';

enum Paddings {
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
  xxl(56),

  /// 64px.
  xxxl(64);

  const Paddings(this.value);

  final double value;

  /// Padding for all sides.
  EdgeInsets get all => EdgeInsets.all(value);

  /// Padding for a single side.
  EdgeInsets only({
    bool left = false,
    bool top = false,
    bool right = false,
    bool bottom = false,
  }) =>
      EdgeInsets.only(
        left: left ? value : 0,
        top: top ? value : 0,
        right: right ? value : 0,
        bottom: bottom ? value : 0,
      );

  /// Symmetric padding.
  EdgeInsets symmetric({
    bool horizontal = false,
    bool vertical = false,
  }) =>
      EdgeInsets.symmetric(
        horizontal: horizontal ? value : 0,
        vertical: vertical ? value : 0,
      );

  /// Horizontal padding widget.
  Widget get horizontal => SizedBox(width: value);

  /// Vertical padding widget.
  Widget get vertical => SizedBox(height: value);
}
