import 'package:asset_tracker/app/constants/app_constants.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_state.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/user_asset/presentation/widget/asset_card.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin UserAssetsMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<UserAssetCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.loadUserAssets();
    });
  }

  Widget buildAssetsList(BuildContext context, UserAssetState state,
      {ScrollController? scrollController}) {
    if (state is UserAssetInitial || state is UserAssetLoading) {
      return _buildLoadingState(context);
    } else if (state is UserAssetError) {
      return _buildErrorState(context, state.message);
    } else if (state is UserAssetLoaded) {
      final assets = state.userAssets;
      if (assets.isEmpty) {
        return _buildEmptyState(context);
      }
      return _buildLoadedState(context, assets, scrollController);
    }
    return Center(child: Text(t.core.errors.unknown));
  }

  Widget _buildLoadingState(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorState(BuildContext context, String errorMessage) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        margin: Paddings.md.all,
        padding: Paddings.md.all,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: Radiuses.sm.all,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.shadow.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline,
                size: AppConstants.iconSizeXLarge,
                color: theme.colorScheme.error),
            Paddings.sm.vertical,
            Text(
              t.core.errors.error,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Paddings.xs.vertical,
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            Paddings.md.vertical,
            ElevatedButton(
              onPressed: () => context.read<UserAssetCubit>().loadUserAssets(),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: Radiuses.lg.all,
                ),
              ),
              child: Text(t.core.errors.tryAgain),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        padding: Paddings.md.all,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: AppConstants.iconSizeXLarge,
              color: theme.colorScheme.primary.withOpacity(0.5),
            ),
            Paddings.sm.vertical,
            Text(
              t.userAsset.portfolio.emptyMessage,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Paddings.xs.vertical,
            Text(
              t.userAsset.portfolio.addAssetHint,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedState(BuildContext context, List<UserAsset> assets,
      ScrollController? scrollController) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserAssetCubit>().loadUserAssets();
      },
      child: ListView.builder(
        controller: scrollController,
        padding: Paddings.sm.all,
        itemCount: assets.length,
        itemBuilder: (context, index) {
          return AssetCard(asset: assets[index]);
        },
      ),
    );
  }
}
