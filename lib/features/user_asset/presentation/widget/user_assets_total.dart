import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/currency_names.dart';

class UserAssetsSummary extends StatelessWidget {
  final List<UserAsset> assets;
  const UserAssetsSummary({super.key, required this.assets});

  @override
  Widget build(BuildContext context) {
    final livePrices = context.watch<SocketCubit>().state is SocketDataReceived
        ? (context.watch<SocketCubit>().state as SocketDataReceived).data.data
        : {};

    double totalInvestment = 0.0;
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

      totalInvestment += initialInvestment;
      totalCurrentValue += assetValue;
      totalProfitLoss += profitLoss;
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Portföy Değeri",
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          Text("₺${totalCurrentValue.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text("Kâr/Zarar", style: TextStyle(color: Colors.grey, fontSize: 12)),
          Text(
            "₺${totalProfitLoss.toStringAsFixed(2)}",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: totalProfitLoss >= 0 ? Colors.green : Colors.red),
          ),
        ],
      ),
    );
  }
}
