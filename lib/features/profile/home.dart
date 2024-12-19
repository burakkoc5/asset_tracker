import 'package:asset_tracker/core/routing/app_router.gr.dart';
import 'package:asset_tracker/core/widgets/container_button.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.authenticationService});

  final AuthenticationService authenticationService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile Screen"),
            AppContainerButton.big(
              center: Text("Logout"),
              onPressed: () {
                authenticationService.signOut();
                context.router.replace(const RegistrationRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
