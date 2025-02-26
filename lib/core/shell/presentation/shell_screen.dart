import 'package:asset_tracker/app/routing/app_router.gr.dart';
import 'package:asset_tracker/core/utils/setup_locator.dart';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ShellScreen extends StatelessWidget {
  final userId = getIt<AuthenticationRepository>().getCurrentUser()!.uid;
  ShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        UserAssetsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: t.home.title,
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: 'Assets'),
          ],
        );
      },
    );
  }
}
