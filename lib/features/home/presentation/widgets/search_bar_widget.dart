import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const SearchBarWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: Paddings.xs.all,
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: t.currency.search.hint,
          prefixIcon: Icon(
            Icons.search,
            color: colorScheme.onSurfaceVariant,
          ),
          border: OutlineInputBorder(
            borderRadius: Radiuses.lg.all,
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: Radiuses.lg.all,
            borderSide: BorderSide(color: colorScheme.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: Radiuses.lg.all,
            borderSide: BorderSide(color: colorScheme.primary),
          ),
          filled: true,
          fillColor: colorScheme.surface,
          contentPadding:
              Paddings.xs.symmetric(horizontal: true, vertical: false),
          hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        ),
        style: TextStyle(color: colorScheme.onSurface),
      ),
    );
  }
}
