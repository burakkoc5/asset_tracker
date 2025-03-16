import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/utils/currency_utils.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:intl/intl.dart';

class UserAssetsSummary extends StatelessWidget {
  final List<UserAsset> assets;
  const UserAssetsSummary({super.key, required this.assets});

  @override
  Widget build(BuildContext context) {
    final socketState = context.watch<SocketCubit>().state;
    final livePrices =
        socketState is SocketDataReceived ? socketState.data.data : {};

    // Debug bilgisi ekleyelim
    debugPrint('SocketCubit State: ${socketState.toString()}');
    debugPrint('LivePrices count: ${livePrices.length}');

    // Liste bazı anahtarları görüntüle
    if (livePrices.isNotEmpty) {
      debugPrint('Some livePrices keys: ${livePrices.keys.take(3).toList()}');
    }

    double totalCurrentValue = 0.0;
    double totalProfitLoss = 0.0;

    for (var asset in assets) {
      // type değeri varlığın türü (USDTRY, EURTRY vb.)
      final String assetType = asset.type ?? '';

      // Hem orijinal key'i hem de lokalize edilmiş ismi denemeye çalışalım
      double? livePrice;

      // Önce direkt tip ile deneyelim (ör. "USDTRY")
      if (livePrices.containsKey(assetType)) {
        livePrice = double.tryParse(livePrices[assetType]!.sell);
        debugPrint(
            'Found price using asset type: $assetType = ${livePrices[assetType]!.sell}');
      }
      // Sonra lokalize edilmiş isimle deneyelim
      else {
        final String localizedName = CurrencyUtils.getLocalizedName(assetType);
        if (livePrices.containsKey(localizedName)) {
          livePrice = double.tryParse(livePrices[localizedName]!.sell);
          debugPrint(
              'Found price using localized name: $localizedName = ${livePrices[localizedName]!.sell}');
        }
      }

      // Eğer canlı fiyat bulunamadıysa satın alma fiyatını kullan
      final currentPrice = livePrice ?? asset.purchasePrice;

      // Debug bilgisi
      debugPrint('Asset: $assetType');
      debugPrint(
          'Purchase Price: ${asset.purchasePrice}, Current Price: $currentPrice');

      final assetValue = currentPrice * asset.amount;
      final initialInvestment = asset.purchasePrice * asset.amount;
      final profitLoss = assetValue - initialInvestment;

      // Debug bilgisi
      debugPrint(
          'Asset Value: $assetValue, Initial Investment: $initialInvestment');
      debugPrint('Profit/Loss for $assetType: $profitLoss');

      totalCurrentValue += assetValue;
      totalProfitLoss += profitLoss;
    }

    // Format the currency values with thousands separators using the current locale
    final currentLocale = LocaleSettings.currentLocale.languageCode;

    final currencyFormatter = NumberFormat('#,##0.00', currentLocale);
    final formattedTotalValue = currencyFormatter.format(totalCurrentValue);
    final formattedProfitLoss = currencyFormatter.format(totalProfitLoss);

    // Toplam kar/zarar için debug bilgisi
    debugPrint(
        'Total Profit/Loss: $totalProfitLoss, Formatted: $formattedProfitLoss');

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
