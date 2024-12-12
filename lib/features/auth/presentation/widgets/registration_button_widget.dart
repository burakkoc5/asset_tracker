import 'package:asset_tracker/core/theme/app_colors.dart';
import 'package:asset_tracker/core/widgets/container_button.dart';
import 'package:flutter/material.dart';

class RegistrationButtonWidget extends StatelessWidget {
  const RegistrationButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.formKey,
    this.color,
  });
  final GlobalKey<FormState>? formKey;
  final String buttonText;
  final Function() onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppContainerButton.normal(
      color: color,
      center: Center(
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      onPressed: () {
        formKey != null
            ? formKey!.currentState!.validate()
                ? onPressed()
                : null
            : onPressed();
      },
    );
  }
}
