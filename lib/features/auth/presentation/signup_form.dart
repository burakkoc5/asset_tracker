import 'package:asset_tracker/core/theme/app_colors.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/core/widgets/container_button.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  SignupForm({super.key});

  final _formKey = GlobalKey<FormState>(); // Key for form validation

  Widget textFieldBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Full Name',
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'Eg John Doe',
            border: OutlineInputBorder(
              borderRadius: Radiuses.sm.all,
            ),
          ),
          validator:
              FormValidators.fullnameValidate, // Applying fullname validator
        ),
        Paddings.sm.vertical,
        const Text(
          'Email address',
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Eg email@email.com',
            border: OutlineInputBorder(
              borderRadius: Radiuses.sm.all,
            ),
          ),
          validator: FormValidators.emailValidate, // Applying email validator
        ),
        Paddings.sm.vertical,
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

  Widget registerButton(BuildContext context) {
    return AppContainerButton(
      center: Center(
        child: Text(
          'Register',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.onPrimary, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // If form is valid register user
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.md.all,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textFieldBuilder(context),
              Paddings.sm.vertical,
              registerButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
