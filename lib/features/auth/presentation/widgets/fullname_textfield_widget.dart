import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class FullnameTextfieldWidget extends StatelessWidget {
  const FullnameTextfieldWidget({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.registration.fullname.fullnameText,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: t.registration.fullname.fullnameHint,
            border: OutlineInputBorder(
              borderRadius: Radiuses.sm.all,
            ),
          ),
          validator:
              FormValidators.fullnameValidate, // Applying fullname validator
        ),
      ],
    );
  }
}
