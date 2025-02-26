import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/currency_names.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final profitLossColor = profitLoss >= 0
        ? Theme.of(context).extension<CustomAppColors>()?.success
        : Theme.of(context).extension<CustomAppColors>()?.error;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        margin: Paddings.sm.symmetric(horizontal: true),
        padding: Paddings.sm.all,
        decoration: BoxDecoration(
          color: Theme.of(context).extension<CustomAppColors>()?.white,
          borderRadius: Radiuses.sm.all,
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
                      "${t.userAsset.portfolio.totalValue.currency}${totalValue.toStringAsFixed(2)}",
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
              Paddings.xs.vertical,
              _buildInfoRow(t.userAsset.assetDetails.amount,
                  widget.asset.amount.toString()),
              _buildInfoRow(t.userAsset.assetDetails.purchasePrice,
                  "${t.userAsset.portfolio.totalValue.currency}${widget.asset.purchasePrice.toStringAsFixed(2)}"),
              _buildInfoRow(t.userAsset.assetDetails.currentPrice,
                  "₺${currentPrice.toStringAsFixed(2)}"),
              _buildInfoRow(t.userAsset.assetDetails.purchaseDate,
                  widget.asset.purchaseDate.toString()),
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
