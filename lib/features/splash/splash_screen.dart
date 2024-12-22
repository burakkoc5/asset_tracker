import 'package:asset_tracker/app/constants/app_constants.dart';
import 'package:asset_tracker/app/routing/app_router.gr.dart';
import 'package:asset_tracker/core/utils/asset_manager.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(AppConstants.appDurationExtraLong, () {
      if (mounted) {
        context.router.replace(const RegistrationRoute());
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
              "Asset Tracker",
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
