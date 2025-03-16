import 'package:flutter/material.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';

class SettingsRadioTile<T> extends StatelessWidget {
  final String title;
  final String? subtitle;
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;

  const SettingsRadioTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}

class SettingsRadioGroup<T> extends StatelessWidget {
  final List<SettingsRadioOption<T>> options;
  final T groupValue;
  final ValueChanged<T?> onChanged;
  final bool showDividers;

  const SettingsRadioGroup({
    super.key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    this.showDividers = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: Radiuses.md.all,
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        children: List.generate(options.length * 2 - 1, (index) {
          // Return divider for odd indices
          if (index.isOdd && showDividers) {
            return const Divider(height: 1);
          }

          // For even indices, return the radio tile
          final optionIndex = index ~/ 2;
          final option = options[optionIndex];

          return SettingsRadioTile<T>(
            title: option.title,
            subtitle: option.subtitle,
            value: option.value,
            groupValue: groupValue,
            onChanged: onChanged,
          );
        }),
      ),
    );
  }
}

class SettingsRadioOption<T> {
  final String title;
  final String? subtitle;
  final T value;

  const SettingsRadioOption({
    required this.title,
    this.subtitle,
    required this.value,
  });
}
