import 'package:asset_tracker/core/theme/app_colors.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/core/widgets/container_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginForm({super.key});

  final _formKey =
      GlobalKey<FormState>(); // Key for the form to manage validation

  Widget textFieldBuilder(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 16),
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

  Widget forgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forgot password?',
          style: TextStyle(
            color: AppColors.primary, // Yeşil renk
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return AppContainerButton(
      center: Center(
        child: Text(
          'Login',
          style: TextStyle(
            color: AppColors.onPrimary, // Beyaz renk
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // If the form is valid, login the user
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
              forgotPasswordButton(context),
              const SizedBox(height: 20),
              loginButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
