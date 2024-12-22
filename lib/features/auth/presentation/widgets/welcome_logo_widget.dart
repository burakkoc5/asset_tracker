import 'package:asset_tracker/app/constants/app_constants.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/utils/asset_manager.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class WelcomeLogoWidget extends StatelessWidget {
  const WelcomeLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Paddings.xxxl.vertical,
        Text(
          t.registration.welcomeText,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Paddings.xs.vertical,
        Text(
          t.core.appName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Image.asset(
          AssetsManager.png.logo,
          width: AppConstants.appLogoSizeMedium,
          height: AppConstants.appLogoSizeMedium,
        ),
      ],
    );
  }
}
