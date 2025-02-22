import 'package:asset_tracker/app/routing/app_router.gr.dart';
import 'package:asset_tracker/core/utils/setup_locator.dart';
import 'package:asset_tracker/app/widgets/container_button.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppContainerButton.normal(
              center: Text(t.registration.signOut.signOutText),
              onPressed: () {
                getIt<AuthenticationRepository>().signOut();
                context.router.replace(const RegistrationRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
