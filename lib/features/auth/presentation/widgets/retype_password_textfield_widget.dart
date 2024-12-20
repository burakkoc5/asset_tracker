import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class ReTypePasswordTextfieldWidget extends StatefulWidget {
  const ReTypePasswordTextfieldWidget({
    super.key,
    required this.passwordController,
    required this.retypepasswordController,
  });

  final TextEditingController passwordController;
  final TextEditingController retypepasswordController;

  @override
  State<ReTypePasswordTextfieldWidget> createState() =>
      _ReTypePasswordTextfieldWidgetState();
}

class _ReTypePasswordTextfieldWidgetState
    extends State<ReTypePasswordTextfieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.registration.confirmPassword.confirmPasswordText,
        ),
        TextFormField(
          controller: widget.retypepasswordController,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: t.registration.confirmPassword.confirmPasswordHint,
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
          validator: (value) => FormValidators.confirmPasswordValidate(
              value, widget.passwordController.text),
        ),
      ],
    );
  }
}
