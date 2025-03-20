import 'package:asset_tracker/app/routing/route_guard.dart';
import 'package:auto_route/auto_route.dart';
import 'package:asset_tracker/app/routing/app_router.gr.dart'; // Your router file

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true, guards: [AuthGuard()]),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(
          page: ShellRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
              guards: [AuthGuard()], // Protect this route with the AuthGuard
            ),
            AutoRoute(
              page: UserAssetsRoute.page,
              path: 'user-assets/:userId',
              guards: [AuthGuard()], // Protect this route with the AuthGuard
            ),
          ],
        ),
        AutoRoute(
          page: TransactionHistoryRoute.page,
          guards: [AuthGuard()], // Protect this route with the AuthGuard
        ),
        AutoRoute(
          page: SettingsRoute.page,
          guards: [AuthGuard()], // Protect this route with the AuthGuard
        ),
      ];
}
