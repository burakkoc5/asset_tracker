import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_state.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/currency_names.dart';
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
    return const Center(child: Text('Beklenmeyen durum.'));
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
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
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
            Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              'Hata',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.read<UserAssetCubit>().loadUserAssets(),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Yeniden Dene'),
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
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 64,
              color: theme.colorScheme.primary.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Henüz varlık bulunmuyor',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Yeni varlık eklemek için + butonuna tıklayın',
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
        padding: const EdgeInsets.all(16),
        itemCount: assets.length,
        itemBuilder: (context, index) {
          return AssetCard(asset: assets[index]);
        },
      ),
    );
  }
}

class AssetCard extends StatefulWidget {
  final UserAsset asset;
  const AssetCard({super.key, required this.asset});

  @override
  _AssetCardState createState() => _AssetCardState();
}

class _AssetCardState extends State<AssetCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final livePrices = context.watch<SocketCubit>().state is SocketDataReceived
        ? (context.watch<SocketCubit>().state as SocketDataReceived).data.data
        : {};

    final assetKey = CurrencyNames.names.entries
        .firstWhere((entry) => entry.value == widget.asset.type,
            orElse: () => const MapEntry('', ''))
        .key;

    final currentPrice = livePrices.containsKey(assetKey)
        ? double.tryParse(livePrices[assetKey]!.sell) ?? 0.0
        : widget.asset.purchasePrice;

    final totalValue = currentPrice * widget.asset.amount;
    final profitLoss =
        (currentPrice - widget.asset.purchasePrice) * widget.asset.amount;
    final profitLossPercent =
        (profitLoss / (widget.asset.purchasePrice * widget.asset.amount)) * 100;
    final profitLossText = profitLoss >= 0
        ? "+${profitLossPercent.toStringAsFixed(2)}%"
        : "-${profitLossPercent.abs().toStringAsFixed(2)}%";
    final profitLossColor = profitLoss >= 0 ? Colors.green : Colors.red;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildAssetIcon(),
                    Paddings.xs.horizontal,
                    Text(
                      widget.asset.type!,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "₺${totalValue.toStringAsFixed(2)}",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      profitLossText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: profitLossColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            if (_isExpanded) ...[
              const SizedBox(height: 8),
              _buildInfoRow("Miktar", widget.asset.amount.toString()),
              _buildInfoRow(
                  "Alış", "₺${widget.asset.purchasePrice.toStringAsFixed(2)}"),
              _buildInfoRow("Güncel", "₺${currentPrice.toStringAsFixed(2)}"),
              _buildInfoRow(
                  "Alış Tarihi", widget.asset.purchaseDate.toString()),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          Text(value,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

Widget _buildAssetIcon() {
  return Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blueAccent.withOpacity(0.2),
    ),
    child: const Icon(Icons.attach_money, color: Colors.blueAccent),
  );
}
