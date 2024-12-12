import 'package:asset_tracker/core/theme/app_colors.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButtonWidget extends StatelessWidget {
  const ForgotPasswordButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          t.registration.signIn.forgotPassword,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primary, // Ana Renk
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
