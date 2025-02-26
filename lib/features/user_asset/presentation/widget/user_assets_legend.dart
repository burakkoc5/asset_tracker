import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:flutter/material.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';

// Not using right now but can be useful in the future
// So code didnt edited
class UserAssetsLegend extends StatelessWidget {
  final List<UserAsset> assets;
  final List<Color> colorPalette;

  const UserAssetsLegend({
    super.key,
    required this.assets,
    required this.colorPalette,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 6,
      alignment: WrapAlignment.start,
      children: List.generate(assets.length, (index) {
        return _buildLegendItem(colorPalette[index % colorPalette.length],
            assets[index].type ?? '');
      }),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: Radiuses.sm.all,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          Paddings.xs.horizontal,
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
