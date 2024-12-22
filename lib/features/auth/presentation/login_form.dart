import 'package:asset_tracker/core/routing/app_router.gr.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';
import 'package:asset_tracker/features/auth/application/authentication_state.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/email_textfield_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/forgot_password_button_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/registration_button_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/password_textfield_widget.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationStateAuthenticated) {
            context.router.popUntilRoot();
            context.router.replace(const ProfileRoute());
          } else if (state is AuthenticationStateError) {
            // Handle the error state and display a snackbar or alert dialog
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        child: SingleChildScrollView(
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
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthenticationCubit>().signin(
                              emailController.text, passwordController.text);
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
