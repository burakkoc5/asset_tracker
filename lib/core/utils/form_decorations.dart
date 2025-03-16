import 'package:flutter/material.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';

/// Form elemanları için ortak stil ve dekorasyon sağlayan utility sınıfı.
class FormDecorations {
  /// Form elemanları için standart InputDecoration oluşturur
  static InputDecoration inputDecoration({
    required ThemeData theme,
    required String label,
    required IconData icon,
    String? hintText,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      labelStyle: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      ),
      prefixIcon: Icon(
        icon,
        color: theme.colorScheme.primary,
        size: 22,
      ),
      border: OutlineInputBorder(
        borderRadius: Radiuses.md.all,
        borderSide: BorderSide(
          color: theme.colorScheme.outline,
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: Radiuses.md.all,
        borderSide: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.7),
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: Radiuses.md.all,
        borderSide: BorderSide(
          color: theme.colorScheme.primary,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: Radiuses.md.all,
        borderSide: BorderSide(
          color: theme.colorScheme.error,
          width: 1.0,
        ),
      ),
      filled: true,
      fillColor: theme.colorScheme.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  /// Form field için standart wrapper - padding ve elemanın ortak stilini uygular
  static Widget buildFieldWrapper({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: child,
    );
  }
}
