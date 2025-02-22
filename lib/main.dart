import 'package:asset_tracker/app/config/app_init.dart';
import 'package:asset_tracker/app/config/app_providers.dart';
import 'package:asset_tracker/app/routing/app_router.dart';
import 'package:asset_tracker/core/theme/theme.dart';
import 'package:asset_tracker/core/theme/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
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
    //final brightness = View.of(context).platformDispatcher.platformBrightness;
    const brightness = Brightness.light;
    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme =
        createTextTheme(context, "Space Grotesk", "Space Grotesk");

    MaterialTheme theme = MaterialTheme(textTheme);
    final appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: appRouter.config(),
    );
  }
}
