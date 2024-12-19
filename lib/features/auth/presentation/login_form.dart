import 'package:asset_tracker/core/routing/app_router.gr.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/utils/setup_locator.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_service.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/email_textfield_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/forgot_password_button_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/registration_button_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/password_textfield_widget.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
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
        EmailTextfieldWidget(emailController: emailController),
        Paddings.sm.vertical,
        PasswordTextfieldWidget(passwordController: passwordController)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: Paddings.md.all,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFieldBuilder(context),
                const ForgotPasswordButtonWidget(),
                Paddings.sm.vertical,
                RegistrationButtonWidget(
                    formKey: _formKey,
                    buttonText: t.registration.signIn.signInText,
                    onPressed: () {
                      getIt<AuthenticationService>().signInWithEmailAndPassword(
                          emailController.text, passwordController.text);
                      context.router.replace(const ProfileRoute());
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
