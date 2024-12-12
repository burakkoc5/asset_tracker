import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/email_textfield_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/fullname_textfield_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/registration_button_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/password_textfield_widget.dart';
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
        FullnameTextfieldWidget(nameController: nameController),
        Paddings.sm.vertical,
        EmailTextfieldWidget(emailController: emailController),
        Paddings.sm.vertical,
        PasswordTextfieldWidget(passwordController: passwordController),
      ],
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
              RegistrationButtonWidget(
                formKey: _formKey,
                buttonText: 'Register',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // If the form is valid, register the user
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
