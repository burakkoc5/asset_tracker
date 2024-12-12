import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:flutter/material.dart';

class EmailTextfieldWidget extends StatelessWidget {
  const EmailTextfieldWidget({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Email address',
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Eg name@email.com',
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
