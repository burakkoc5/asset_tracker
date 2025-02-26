import 'package:asset_tracker/features/user_asset/presentation/widget/user_assets_total.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/websocket/application/socket_cubit.dart';
import 'package:asset_tracker/features/websocket/domain/currency_names.dart';
import 'user_assets_legend.dart';

class UserAssetsPieChart extends StatefulWidget {
  final List<UserAsset> assets;
  const UserAssetsPieChart({super.key, required this.assets});

  @override
  _UserAssetsPieChartState createState() => _UserAssetsPieChartState();
}

class _UserAssetsPieChartState extends State<UserAssetsPieChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final livePrices = context.watch<SocketCubit>().state is SocketDataReceived
        ? (context.watch<SocketCubit>().state as SocketDataReceived).data.data
        : {};

    List<Color> colorPalette = [
      Colors.indigo,
      Colors.teal,
      Colors.deepOrange,
      Colors.purple,
      Colors.blueGrey,
      Colors.green,
      Colors.amber,
      Colors.cyan,
      Colors.brown,
      Colors.lime,
    ];

    List<PieChartSectionData> pieSections = [];

    for (int i = 0; i < widget.assets.length; i++) {
      final asset = widget.assets[i];
      final assetKey = CurrencyNames.names.entries
          .firstWhere((entry) => entry.value == asset.type,
              orElse: () => const MapEntry('', ''))
          .key;

      final currentPrice = livePrices.containsKey(assetKey)
          ? double.tryParse(livePrices[assetKey]!.sell) ?? asset.purchasePrice
          : asset.purchasePrice;

      final assetValue = currentPrice * asset.amount;

      pieSections.add(PieChartSectionData(
        value: assetValue,
        title: '',
        color: colorPalette[i % colorPalette.length],
        radius: touchedIndex == i ? 25 : 15,
        badgeWidget: touchedIndex == i
            ? Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black87.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Text(
                  "${asset.type}\n₺${assetValue.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : null,
      ));
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sections: pieSections,
                  sectionsSpace: 0,
                  centerSpaceRadius: 100,
                  borderData: FlBorderData(show: false),
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null ||
                            event is FlTapUpEvent) {
                          touchedIndex = null;
                        } else {
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              child: UserAssetsSummary(assets: widget.assets),
            ),
          ],
        ),
        //const SizedBox(height: 16),
        //UserAssetsLegend(assets: widget.assets, colorPalette: colorPalette),
      ],
    );
  }
}
