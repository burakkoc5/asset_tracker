import 'package:asset_tracker/core/routing/app_router.gr.dart';
import 'package:asset_tracker/core/utils/setup_locator.dart';
import 'package:asset_tracker/core/widgets/container_button.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_service.dart';
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
            const Text("Profile Screen"),
            AppContainerButton.big(
              center: const Text("Logout"),
              onPressed: () {
                getIt<AuthenticationService>().signOut();
                context.router.replace(const RegistrationRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
