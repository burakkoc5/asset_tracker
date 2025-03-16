import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/currency_names.dart';
import 'package:intl/intl.dart';

class UserAssetsSummary extends StatelessWidget {
  final List<UserAsset> assets;
  const UserAssetsSummary({super.key, required this.assets});

  @override
  Widget build(BuildContext context) {
    final livePrices = context.watch<SocketCubit>().state is SocketDataReceived
        ? (context.watch<SocketCubit>().state as SocketDataReceived).data.data
        : {};

    double totalCurrentValue = 0.0;
    double totalProfitLoss = 0.0;

    for (var asset in assets) {
      final assetKey = CurrencyNames.names.entries
          .firstWhere((entry) => entry.value == asset.type,
              orElse: () => const MapEntry('', ''))
          .key;

      final currentPrice = livePrices.containsKey(assetKey)
          ? double.tryParse(livePrices[assetKey]!.sell) ?? asset.purchasePrice
          : asset.purchasePrice;

      final assetValue = currentPrice * asset.amount;
      final initialInvestment = asset.purchasePrice * asset.amount;
      final profitLoss = assetValue - initialInvestment;

      totalCurrentValue += assetValue;
      totalProfitLoss += profitLoss;
    }

    // Format the currency values with thousands separators using the current locale
    final currentLocale = LocaleSettings.currentLocale.languageCode;
    final currencyFormatter = NumberFormat('#,##0.00', currentLocale);
    final formattedTotalValue = currencyFormatter.format(totalCurrentValue);
    final formattedProfitLoss = currencyFormatter.format(totalProfitLoss);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.userAsset.portfolio.totalValue.label,
            style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text("${t.userAsset.portfolio.totalValue.currency}$formattedTotalValue",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Paddings.xxs.vertical,
        Text(t.userAsset.portfolio.profitLoss,
            style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(
          "${t.userAsset.portfolio.totalValue.currency}$formattedProfitLoss",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: totalProfitLoss >= 0
                  ? Theme.of(context).extension<CustomAppColors>()?.success
                  : Theme.of(context).extension<CustomAppColors>()?.error),
        ),
      ],
    );
  }
}
