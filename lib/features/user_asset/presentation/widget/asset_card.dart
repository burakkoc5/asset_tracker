import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AssetCard extends StatefulWidget {
  final UserAsset asset;
  const AssetCard({super.key, required this.asset});

  @override
  AssetCardState createState() => AssetCardState();
}

class AssetCardState extends State<AssetCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = Theme.of(context).extension<CustomAppColors>();

    final livePrices = context.watch<SocketCubit>().state is SocketDataReceived
        ? (context.watch<SocketCubit>().state as SocketDataReceived).data.data
        : {};

    // The asset type stored in UserAsset should already be the key
    // No need for complex lookup that might cause issues
    final assetKey = widget.asset.type ?? '';

    final currentPrice = livePrices.containsKey(assetKey)
        ? double.tryParse(livePrices[assetKey]!.sell) ?? 0.0
        : widget.asset.purchasePrice;

    final totalValue = currentPrice * widget.asset.amount;
    final profitLoss =
        (currentPrice - widget.asset.purchasePrice) * widget.asset.amount;
    final profitLossPercent =
        (profitLoss / (widget.asset.purchasePrice * widget.asset.amount)) * 100;

    // Format currency values using the current locale
    final currentLocale = LocaleSettings.currentLocale.languageCode;
    final currencyFormatter = NumberFormat('#,##0.00', currentLocale);
    final formattedTotalValue = currencyFormatter.format(totalValue);
    final formattedCurrentPrice = currencyFormatter.format(currentPrice);
    final formattedPurchasePrice =
        currencyFormatter.format(widget.asset.purchasePrice);
    final formattedProfitLoss = currencyFormatter.format(profitLoss.abs());

    final profitLossText = profitLoss >= 0
        ? "+${profitLossPercent.toStringAsFixed(2)}%"
        : "-${profitLossPercent.abs().toStringAsFixed(2)}%";
    final profitLossColor =
        profitLoss >= 0 ? customColors?.success : customColors?.error;

    // Format the purchase date using the current locale
    String formattedDate = '';
    if (widget.asset.purchaseDate != null) {
      final dateFormatter = DateFormat('dd.MM.yyyy', currentLocale);
      formattedDate = dateFormatter.format(widget.asset.purchaseDate!);
    }

    return Card(
      margin: Paddings.xxs.symmetric(vertical: true),
      elevation: 0,
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: Radiuses.md.all,
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        borderRadius: Radiuses.md.all,
        child: Padding(
          padding: Paddings.md.all,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Asset icon with background
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(0.1),
                      borderRadius: Radiuses.sm.all,
                    ),
                    child: Center(
                      child: Icon(
                        _getAssetIcon(widget.asset.type ?? ''),
                        color: theme.colorScheme.primary,
                        size: 24,
                      ),
                    ),
                  ),
                  Paddings.sm.horizontal,

                  // Asset details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.asset.type ?? '',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                // Use a unit translation that supports pluralization
                                "${widget.asset.amount} ${widget.asset.amount == 1 ? t.general.unit : t.general.units}",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (widget.asset.purchaseDate != null) ...[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  "•",
                                  style: TextStyle(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 14,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  formattedDate,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Value and profit/loss
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${t.userAsset.portfolio.totalValue.currency}$formattedTotalValue",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: profitLossColor?.withOpacity(0.1),
                          borderRadius: Radiuses.xxs.all,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              profitLoss >= 0
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: profitLossColor,
                              size: 14,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              profitLossText,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: profitLossColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // Expanded details
              if (_isExpanded) ...[
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailItem(
                      context,
                      Icons.price_change,
                      t.userAsset.assetDetails.purchasePrice,
                      "${t.userAsset.portfolio.totalValue.currency}$formattedPurchasePrice",
                    ),
                    _buildDetailItem(
                      context,
                      Icons.trending_up,
                      t.userAsset.assetDetails.currentPrice,
                      "${t.userAsset.portfolio.totalValue.currency}$formattedCurrentPrice",
                    ),
                    _buildDetailItem(
                      context,
                      profitLoss >= 0 ? Icons.trending_up : Icons.trending_down,
                      t.userAsset.portfolio.profitLoss,
                      "${profitLoss >= 0 ? '+' : '-'}${t.userAsset.portfolio.totalValue.currency}$formattedProfitLoss",
                      valueColor: profitLossColor,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(
    BuildContext context,
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    final theme = Theme.of(context);

    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: theme.colorScheme.primary.withOpacity(0.7),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: valueColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getAssetIcon(String assetType) {
    if (assetType.toLowerCase().contains('altın') ||
        assetType.toLowerCase().contains('gold')) {
      return Icons.monetization_on;
    } else if (assetType.toLowerCase().contains('dolar') ||
        assetType.toLowerCase().contains('dollar')) {
      return Icons.attach_money;
    } else if (assetType.toLowerCase().contains('euro')) {
      return Icons.euro;
    } else if (assetType.toLowerCase().contains('sterlin') ||
        assetType.toLowerCase().contains('sterling')) {
      return Icons.currency_pound;
    } else {
      return Icons.account_balance_wallet;
    }
  }
}
