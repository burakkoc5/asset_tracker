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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: Radiuses.sm.all,
        child: Container(
          padding: padding ??
              EdgeInsets.only(left: isBig ? 16 : 8, right: isBig ? 16 : 4),
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.primaryContainer,
            borderRadius: Radiuses.sm.all,
          ),
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
    );
  }
}
