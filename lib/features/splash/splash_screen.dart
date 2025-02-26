import 'package:asset_tracker/app/constants/app_constants.dart';
import 'package:asset_tracker/app/routing/app_router.gr.dart';
import 'package:asset_tracker/core/utils/asset_manager.dart';
import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';
import 'package:asset_tracker/features/auth/application/authentication_state.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateToNextScreen() async {
    final authCubit = context.read<AuthenticationCubit>();

    if (authCubit.state is! AuthenticationStateAuthenticated) {
      context.router.replace(const RegistrationRoute());
    } else {
      context.router.replace(ShellRoute());
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(AppConstants.appDurationExtraLong, () {
      if (mounted) {
        _navigateToNextScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsManager.png.logo,
              width: AppConstants.appLogoSizeMedium,
              height: AppConstants.appLogoSizeMedium,
            ),
            Text(
              t.core.appName,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
