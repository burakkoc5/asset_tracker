import 'package:asset_tracker/app/config/app_init.dart';
import 'package:asset_tracker/app/config/app_providers.dart';
import 'package:asset_tracker/app/routing/app_router.dart';
import 'package:asset_tracker/core/theme/theme.dart';
import 'package:asset_tracker/core/theme/util.dart';
import 'package:asset_tracker/features/settings/application/settings_cubit.dart';
import 'package:asset_tracker/features/settings/domain/app_settings.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // Initialize the app
  await AppInit.init();

  runApp(MultiBlocProvider(
    providers: AppProviders.getProviders(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the AppRouter
    final appRouter = AppRouter();

    // Create text theme
    TextTheme textTheme = createTextTheme(context, "Inter", "Inter");

    // Create theme
    MaterialTheme theme = MaterialTheme(textTheme);

    return BlocBuilder<SettingsCubit, AppSettings>(
      builder: (context, settings) {
        // Set current locale from settings
        LocaleSettings.setLocale(settings.locale);

        // Wrap with TranslationProvider for proper translation support
        return TranslationProvider(
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            themeMode: settings.themeMode, // For dark mode
            theme: theme.light(),
            darkTheme: theme.dark(),
            // Apply localization configuration
            locale: settings.locale.flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            routerConfig: appRouter.config(),
          ),
        );
      },
    );
  }
}
