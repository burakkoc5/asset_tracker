import 'package:asset_tracker/core/utils/setup_locator.dart';
import 'package:asset_tracker/firebase_options.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppInit {
  static Future<void> init() async {
    try {
      // Initialize WidgetsBinding
      WidgetsFlutterBinding.ensureInitialized();

      // Load environment variables
      await dotenv.load(fileName: ".env");

      // Initialize Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Initialize date formatting
      await initializeDateFormatting('tr_TR', null);
      await initializeDateFormatting('en', null);
      // Initialize GetIt (dependency injection)

      await setupLocator();
      await _initializeLocalization();
    } catch (e) {
      debugPrint('Error during app initialization: $e');
      // Continue with minimal initialization when full init fails
      // This allows the app to at least start
    }
  }

  static Future<void> _initializeLocalization() async {
    try {
      // Use device locale for initial startup
      await LocaleSettings.useDeviceLocale();
    } catch (e) {
      debugPrint('Error initializing localization: $e');
      // Fallback to a default locale on error
      try {
        LocaleSettings.setLocale(AppLocale.tr);
      } catch (_) {
        // Ignore additional errors in error handler
      }
    }
  }
}
