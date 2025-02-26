import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/user_asset/presentation/widget/user_assets_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_state.dart';

import 'user_assets_mixin.dart';

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
                      'Varlıklarım',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    floating: true,
                    pinned: false,
                    expandedHeight: MediaQuery.of(context).size.height / 2.7,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: Paddings.xl.only(
                          top: true,
                        ),
                        child: UserAssetsPieChart(assets: assets),
                      ),
                    ),
                  ),
                ];
              },
              body: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  return AssetCard(asset: assets[index]);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
