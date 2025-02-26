import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    double height = 600,
    bool isDismissible = true,
    bool isTransparent = false,
    bool expand = false,
    bool enableDrag = true,
    Color? backgroundColor,
  }) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      backgroundColor: isTransparent
          ? Theme.of(context).extension<CustomAppColors>()?.transparent
          : backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: Radiuses.lg.only(topLeft: true, topRight: true),
      ),
      builder: (BuildContext context) {
        return GestureDetector(
          onVerticalDragUpdate: enableDrag
              ? (details) {
                  // Custom drag behavior
                  if (details.primaryDelta! < -5) {
                    Navigator.of(context).pop(); // close the bottom sheet
                  }
                }
              : null,
          child: Container(
            height: expand ? double.infinity : height,
            decoration: BoxDecoration(
              color: isTransparent
                  ? Theme.of(context).extension<CustomAppColors>()?.transparent
                  : backgroundColor ??
                      Theme.of(context).scaffoldBackgroundColor,
              borderRadius: Radiuses.lg.only(topLeft: true, topRight: true),
            ),
            child: Column(
              children: [
                Padding(
                  padding: Paddings.sm.symmetric(vertical: true),
                  child: Center(
                    child: Container(
                      width: 48,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: Radiuses.sm.all,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
