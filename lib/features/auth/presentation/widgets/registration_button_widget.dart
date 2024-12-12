import 'package:asset_tracker/core/theme/app_colors.dart';
import 'package:asset_tracker/core/widgets/container_button.dart';
import 'package:flutter/material.dart';

class RegistrationButtonWidget extends StatelessWidget {
  const RegistrationButtonWidget(
      {super.key,
      required this.formKey,
      required this.buttonText,
      required this.onPressed});
  final GlobalKey<FormState> formKey;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppContainerButton(
      center: Center(
        child: Text(
          'Login',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.onPrimary, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          // If the form is valid, login the user
        }
      },
    );
  }
}
