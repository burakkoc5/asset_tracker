import 'package:asset_tracker/app/routing/app_router.gr.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ShellScreen extends StatelessWidget {
  const ShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ProfileRoute(),
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
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_2_outlined),
              label: t.profile.title,
            ),
          ],
        );
      },
    );
  }
}
