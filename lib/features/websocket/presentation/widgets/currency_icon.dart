import 'package:asset_tracker/core/utils/currency_utils.dart';
import 'package:flutter/material.dart';

class CurrencyIcon extends StatelessWidget {
  final String code;
  final double size;
  final Color? color;

  const CurrencyIcon({
    super.key,
    required this.code,
    this.size = 24,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = color ?? theme.colorScheme.primary;

    return Icon(
      CurrencyUtils.getCurrencyIconData(code),
      color: iconColor,
      size: size,
    );
  }
}
