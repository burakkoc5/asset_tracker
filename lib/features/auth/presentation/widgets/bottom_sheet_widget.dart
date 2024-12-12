import 'package:asset_tracker/core/theme/app_colors.dart';
import 'package:asset_tracker/features/auth/presentation/login_form.dart';
import 'package:asset_tracker/features/auth/presentation/signup_form.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key, required this.index});

  final int index;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.index,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicatorColor: AppColors.primary, // Ana Renk
            labelColor: AppColors.primary, // Ana Renk
            unselectedLabelColor: AppColors.onPrimaryContainer, // Gri
            tabs: [
              Tab(text: t.registration.signIn.signInText),
              Tab(text: t.registration.signUp.signUpText),
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
}
