import 'package:asset_tracker/core/theme/app_colors.dart';
import 'package:asset_tracker/core/theme/paddings';
import 'package:asset_tracker/core/widgets/bottom_sheet.dart';
import 'package:asset_tracker/core/widgets/container_button.dart';
import 'package:asset_tracker/features/auth/presentation/login_form.dart';
import 'package:asset_tracker/features/auth/presentation/signup_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  Widget bottomSheetWidget(int index) {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: index,
    );
    return Material(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicatorColor: AppColors.primary, // Ana Renk
            labelColor: AppColors.primary, // Ana Renk
            unselectedLabelColor: AppColors.onPrimaryContainer, // Gri
            tabs: const [
              Tab(text: "Sign in"),
              Tab(text: "Sign up"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                LoginForm(),
                SignupForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Paddings.md.symmetric(horizontal: true),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                //SvgPicture.asset('assets/images/welcome.svg'),
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Asset Tracker',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              children: [
                AppContainerButton(
                  color: AppColors.primary, // Ana Renk
                  center: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          color: AppColors.onPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                    CustomBottomSheet.show(context,
                        child: bottomSheetWidget(
                          0,
                        ));
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                AppContainerButton(
                  center: Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.onPrimary),
                    ),
                  ),
                  onPressed: () {
                    CustomBottomSheet.show(
                      context,
                      child: bottomSheetWidget(
                        1,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'By signing up, you agree to our terms and conditions',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
