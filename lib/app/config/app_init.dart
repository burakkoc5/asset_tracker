import 'package:asset_tracker/core/utils/setup_locator.dart';
import 'package:asset_tracker/firebase_options.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AppInit {
  static Future<void> init() async {
    // Initialize WidgetsBinding
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Initialize GetIt
    setupLocator();

    // Initialize localization language
    LocaleSettings.useDeviceLocale();
  }
}
