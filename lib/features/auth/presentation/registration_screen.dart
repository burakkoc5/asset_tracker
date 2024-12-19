import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/widgets/bottom_sheet.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_service.dart';
import 'package:asset_tracker/features/auth/infrastructure/concrete/firebase_auth_repository.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/bottom_sheet_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/registration_button_widget.dart';
import 'package:asset_tracker/features/auth/presentation/widgets/welcome_logo_widget.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int loginIndex = 0;
  int signupIndex = 1;
  AuthenticationService authService = FirebaseAuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.md.symmetric(horizontal: true),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const WelcomeLogoWidget(),
            Paddings.xxxl.vertical,
            Column(
              children: [
                RegistrationButtonWidget(
                    buttonText: t.registration.signIn.signInText,
                    onPressed: () {
                      CustomBottomSheet.show(context,
                          child: BottomSheetWidget(
                            index: loginIndex,
                            authenticationService: authService,
                          ));
                    }),
                Paddings.sm.vertical,
                RegistrationButtonWidget(
                    buttonText: t.registration.signUp.signUpText,
                    onPressed: () {
                      CustomBottomSheet.show(context,
                          child: BottomSheetWidget(
                            index: signupIndex,
                            authenticationService: authService,
                          ));
                    }),
                Paddings.sm.vertical,
                Text(
                  t.registration.termsAndConditionsText,
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
