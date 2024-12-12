import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:flutter/material.dart';

class WelcomeLogoWidget extends StatelessWidget {
  const WelcomeLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Paddings.xxxl.vertical,
        Text(
          'Welcome',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Paddings.xs.vertical,
        Text(
          'Asset Tracker',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Image.asset(
          'assets/images/logo.png',
          width: 150,
          height: 150,
        ),
      ],
    );
  }
}
