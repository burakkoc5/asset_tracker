import 'package:asset_tracker/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
