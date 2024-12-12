import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:flutter/material.dart';

class PasswordTextfieldWidget extends StatelessWidget {
  const PasswordTextfieldWidget({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
        ),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(
              borderRadius: Radiuses.sm.all,
            ),
          ),
          validator:
              FormValidators.passwordValidate, // Applying password validator
        ),
      ],
    );
  }
}
