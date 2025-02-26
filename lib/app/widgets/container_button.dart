import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:flutter/material.dart';

class AppContainerButton extends StatelessWidget {
  const AppContainerButton.normal({
    required this.center,
    this.height,
    this.onPressed,
    this.color,
    this.padding,
    this.margin,
    super.key,
  }) : isBig = false;

  const AppContainerButton.big({
    required this.center,
    this.height,
    this.onPressed,
    this.color,
    this.padding,
    this.margin,
    super.key,
  }) : isBig = true;

  final Widget center;
  final Color? color;
  final double? height;
  final bool isBig;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.primaryContainer,
        borderRadius: Radiuses.sm.all,
      ),
      child: Material(
        color: Theme.of(context).extension<CustomAppColors>()?.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor:
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.7),
          borderRadius: Radiuses.sm.all,
          child: Container(
            padding: padding ??
                EdgeInsets.only(
                    left: isBig ? Paddings.md.value : Paddings.sm.value,
                    right: isBig ? Paddings.md.value : Paddings.xxs.value),
            height: height ?? 48,
            margin: margin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isBig ? Paddings.xs.horizontal : Container(),
                Expanded(child: center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
