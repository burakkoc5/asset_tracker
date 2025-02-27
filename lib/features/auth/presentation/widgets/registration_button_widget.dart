import 'package:asset_tracker/app/widgets/container_button.dart';
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
