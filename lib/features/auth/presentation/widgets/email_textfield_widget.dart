import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class EmailTextfieldWidget extends StatelessWidget {
  const EmailTextfieldWidget({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.registration.email.emailText,
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: t.registration.email.emailHint,
            border: OutlineInputBorder(
              borderRadius: Radiuses.sm.all,
            ),
          ),
          validator: FormValidators.emailValidate, // Applying email validator
        ),
      ],
    );
  }
}
