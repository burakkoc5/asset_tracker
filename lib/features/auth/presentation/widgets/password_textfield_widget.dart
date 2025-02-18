import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class PasswordTextfieldWidget extends StatefulWidget {
  const PasswordTextfieldWidget({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  State<PasswordTextfieldWidget> createState() =>
      _PasswordTextfieldWidgetState();
}

class _PasswordTextfieldWidgetState extends State<PasswordTextfieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.registration.password.passwordText,
        ),
        TextFormField(
          controller: widget.passwordController,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: t.registration.password.passwordHint,
            border: OutlineInputBorder(
              borderRadius: Radiuses.sm.all,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText; // şifreyi gizle/göster
                });
              },
            ),
          ),
          validator:
              FormValidators.passwordValidate, // Applying password validator
        ),
      ],
    );
  }
}
