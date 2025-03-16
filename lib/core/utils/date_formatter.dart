import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  /// Çeşitli formatlardaki tarih dizelerini kullanıcı dostu bir formata dönüştürür.
  static String formatDateTime(String dateTimeStr) {
    try {
      // Parse the input date string
      DateTime? dateTime;

      // Get current locale code from LocaleSettings
      final currentLocale = LocaleSettings.currentLocale.languageCode;

      // Try various date formats to handle different possibilities
      try {
        // Handle "dd-MM-yyyy HH:mm:ss" format (like "15-03-2025 22:45:30")
        final parts = dateTimeStr.trim().split(' ');
        if (parts.length >= 2 && parts[0].contains('-')) {
          final dateParts = parts[0].split('-');
          if (dateParts.length == 3) {
            final day = int.parse(dateParts[0]);
            final month = int.parse(dateParts[1]);
            final year = int.parse(dateParts[2]);

            final timeParts = parts[1].split(':');
            final hour = int.parse(timeParts[0]);
            final minute = timeParts.length > 1 ? int.parse(timeParts[1]) : 0;
            final second = timeParts.length > 2 ? int.parse(timeParts[2]) : 0;

            dateTime = DateTime(year, month, day, hour, minute, second);
          }
        } else {
          // Try standard formats if it's not in dd-MM-yyyy format
          dateTime = DateTime.parse(dateTimeStr.trim());
        }
      } catch (e) {
        // Try different formats
        try {
          // Try with the date format patterns that match the expected input
          final List<String> formats = [
            "dd.MM.yyyy HH:mm:ss",
            "dd-MM-yyyy HH:mm:ss",
            "yyyy-MM-dd HH:mm:ss",
            "yyyy-MM-dd'T'HH:mm:ss",
            "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
          ];

          for (final format in formats) {
            try {
              dateTime = DateFormat(format).parse(dateTimeStr.trim());
              break;
            } catch (_) {
              // Continue trying other formats
            }
          }

          // If all formats failed, return original
          if (dateTime == null) {
            return dateTimeStr;
          }
        } catch (_) {
          // If all else fails, return original
          return dateTimeStr;
        }
      }

      // Format the date in a more readable way if we successfully parsed it
      if (dateTime != null) {
        // Format date based on locale - use a simple, readable format
        return DateFormat("dd MMM yyyy HH:mm", currentLocale).format(dateTime);
      } else {
        return dateTimeStr;
      }
    } catch (e) {
      // If parsing fails, return the original string
      return dateTimeStr;
    }
  }

  /// Tarih formatını belirtilen formatta döndürür
  static String formatDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Form'da kullanılacak tarih seçici widget builder
  static Future<DateTime?> showAppDatePicker({
    required BuildContext context,
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final theme = Theme.of(context);

    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: theme.colorScheme.primary,
              onPrimary: theme.colorScheme.onPrimary,
              surface: theme.colorScheme.surface,
              onSurface: theme.colorScheme.onSurface,
            ),
            dialogBackgroundColor: theme.colorScheme.surface,
          ),
          child: child!,
        );
      },
    );
  }
}
