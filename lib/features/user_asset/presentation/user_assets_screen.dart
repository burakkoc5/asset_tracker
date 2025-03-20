import 'package:asset_tracker/app/routing/app_router.gr.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/user_asset/presentation/widget/add_asset_form.dart';
import 'package:asset_tracker/features/user_asset/presentation/widget/asset_card.dart';
import 'package:asset_tracker/features/user_asset/presentation/widget/user_assets_chart.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_state.dart';

import 'user_assets_mixin.dart';

@RoutePage()
class UserAssetsScreen extends StatefulWidget {
  const UserAssetsScreen({super.key});

  @override
  State<UserAssetsScreen> createState() => _UserAssetsScreenState();
}

class _UserAssetsScreenState extends State<UserAssetsScreen>
    with UserAssetsMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<UserAssetCubit, UserAssetState>(
      builder: (context, state) {
        if (state is! UserAssetLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final assets = state.userAssets;

        return Scaffold(
          body: SafeArea(
            child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    title: Text(
                      t.userAsset.portfolio.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    actions: [
                      // Transaction history button
                      IconButton(
                        icon: Icon(
                          Icons.history,
                          color: theme.colorScheme.primary,
                        ),
                        onPressed: () {
                          context.router.push(const TransactionHistoryRoute());
                        },
                        tooltip: t.userAsset.transactions.viewAll,
                      ),
                      // Settings button
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: theme.colorScheme.primary,
                        ),
                        onPressed: () {
                          context.router.push(const SettingsRoute());
                        },
                        tooltip: t.general.settings,
                      ),
                      Paddings.xs.horizontal,
                    ],
                    centerTitle: true,
                    backgroundColor: theme.colorScheme.surface,
                    elevation: 0,
                    floating: true,
                    pinned: false,
                    expandedHeight: assets.isNotEmpty
                        ? MediaQuery.of(context).size.height / 2.7
                        : 0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: Paddings.xl.only(
                          top: true,
                        ),
                        child: assets.isNotEmpty
                            ? UserAssetsPieChart(assets: assets)
                            : const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ];
              },
              body: assets.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: Paddings.lg.all,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceVariant
                                  .withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              size: 64,
                              color: theme.colorScheme.primary.withOpacity(0.7),
                            ),
                          ),
                          Paddings.md.vertical,
                          Text(
                            t.userAsset.portfolio.emptyMessage,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Paddings.sm.vertical,
                          Text(
                            t.userAsset.portfolio.addAssetHint,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            theme.colorScheme.surface,
                            theme.colorScheme.surfaceContainerHighest
                                .withOpacity(0.3),
                          ],
                        ),
                      ),
                      child: ListView.builder(
                        padding: Paddings.sm.all,
                        itemCount: assets.length,
                        itemBuilder: (context, index) {
                          return AssetCard(asset: assets[index]);
                        },
                      ),
                    ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => DraggableScrollableSheet(
                  initialChildSize: 0.9,
                  maxChildSize: 0.9,
                  minChildSize: 0.5,
                  builder: (_, controller) => Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: const AddAssetForm(),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
