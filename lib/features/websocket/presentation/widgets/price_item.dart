import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:flutter/material.dart';

class PriceItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isUp;
  final Color? color;

  const PriceItem({
    super.key,
    required this.label,
    required this.value,
    required this.isUp,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = Theme.of(context).extension<CustomAppColors>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        // Price with Direction
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: isUp
                    ? customColors?.success.withOpacity(0.1)
                    : customColors?.error.withOpacity(0.1),
                borderRadius: Radiuses.xxs.all,
              ),
              child: Icon(
                isUp ? Icons.arrow_upward : Icons.arrow_downward,
                color: color,
                size: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
