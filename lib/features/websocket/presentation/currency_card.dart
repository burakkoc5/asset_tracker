import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/currency_utils.dart';
import 'package:asset_tracker/core/utils/date_formatter.dart';
import 'package:asset_tracker/features/websocket/domain/currency.dart';
import 'package:asset_tracker/features/websocket/presentation/widgets/currency_icon.dart';
import 'package:asset_tracker/features/websocket/presentation/widgets/detail_item.dart';
import 'package:asset_tracker/features/websocket/presentation/widgets/price_item.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatefulWidget {
  CurrencyCard({required this.currency}) : super(key: ValueKey(currency.code));
  final Currency currency;

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = Theme.of(context).extension<CustomAppColors>();

    final isAlisUp = widget.currency.dir.buyDirection == 'up';
    final isSatisUp = widget.currency.dir.sellDirection == 'up';
    final alisColor = isAlisUp ? customColors?.success : customColors?.error;
    final satisColor = isSatisUp ? customColors?.success : customColors?.error;

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
        borderRadius: Radiuses.md.all,
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: _expanded ? 16 : 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardHeader(theme, customColors, alisColor, satisColor),

              // Expanded details
              if (_expanded) ...[
                const Divider(height: 24),
                _buildExpandedDetails(
                    customColors, isAlisUp, isSatisUp, alisColor, satisColor),
              ] else ...[
                _buildExpandIndicator(theme),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Kartın üst kısmı (her zaman görünür)
  Widget _buildCardHeader(ThemeData theme, CustomAppColors? customColors,
      Color? alisColor, Color? satisColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Para birimi ikonu ve arkaplanı
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: Radiuses.sm.all,
          ),
          child: Center(
            child: CurrencyIcon(code: widget.currency.code),
          ),
        ),
        Paddings.sm.horizontal,

        // Para birimi adı ve kodu
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Para birimi adı
              Text(
                CurrencyUtils.getLocalizedName(widget.currency.code),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              // Para birimi kodu ve fiyatlar
              _buildCurrencyCodeAndPrices(theme, alisColor, satisColor),
            ],
          ),
        ),

        // Fiyat ve yön göstergesi
        _buildPriceWithDirection(theme, customColors, satisColor,
            isSatisUp: widget.currency.dir.sellDirection == 'up'),
      ],
    );
  }

  // Fiyat ve yön göstergesini oluşturur
  Widget _buildPriceWithDirection(
      ThemeData theme, CustomAppColors? customColors, Color? priceColor,
      {required bool isSatisUp}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Satış Fiyatı
        Text(
          "₺${widget.currency.sell}",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: priceColor,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 2),
        // Yön rozeti
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: isSatisUp
                ? customColors?.success.withOpacity(0.1)
                : customColors?.error.withOpacity(0.1),
            borderRadius: Radiuses.xxs.all,
          ),
          child: Icon(
            isSatisUp ? Icons.arrow_upward : Icons.arrow_downward,
            color: priceColor,
            size: 12,
          ),
        ),
      ],
    );
  }

  // Para birimi kodu ve fiyatları gösteren kısım
  Widget _buildCurrencyCodeAndPrices(
      ThemeData theme, Color? alisColor, Color? satisColor) {
    return Row(
      children: [
        // Kod veya alış bilgisi
        Text(
          _expanded
              ? widget.currency.code
              : "${t.currency.details.buy}: ₺${widget.currency.buy}",
          style: theme.textTheme.bodyMedium?.copyWith(
            color: _expanded
                ? theme.colorScheme.onSurfaceVariant
                : theme.colorScheme.onSurface,
            fontWeight: _expanded ? FontWeight.normal : FontWeight.w500,
            fontSize: 13,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        if (!_expanded) ...[
          // Ayırıcı nokta
          Container(
            margin: Paddings.xxs.all,
            width: 3,
            height: 3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
            ),
          ),
          // Satış fiyatı
          Expanded(
            child: Text(
              "${t.currency.details.sell}: ₺${widget.currency.sell}",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }

  // Genişlemiş detay kısmı
  Widget _buildExpandedDetails(CustomAppColors? customColors, bool isAlisUp,
      bool isSatisUp, Color? alisColor, Color? satisColor) {
    return Column(
      children: [
        // Alış ve Satış Fiyatları
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Alış/Satış Fiyatları
            Expanded(
              child: Row(
                children: [
                  // Alış Fiyatı
                  Expanded(
                    child: PriceItem(
                      label: t.currency.details.buy,
                      value: "₺${widget.currency.buy}",
                      isUp: isAlisUp,
                      color: alisColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Satış Fiyatı
                  Expanded(
                    child: PriceItem(
                      label: t.currency.details.sell,
                      value: "₺${widget.currency.sell}",
                      isUp: isSatisUp,
                      color: satisColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // En Düşük/En Yüksek Fiyatlar
        Row(
          children: [
            // En Düşük Fiyat
            Expanded(
              child: DetailItem(
                icon: Icons.arrow_circle_down_outlined,
                label: t.currency.details.lowest,
                value: "₺${widget.currency.low}",
                valueColor: customColors?.error,
              ),
            ),
            const SizedBox(width: 16),
            // En Yüksek Fiyat
            Expanded(
              child: DetailItem(
                icon: Icons.arrow_circle_up_outlined,
                label: t.currency.details.highest,
                value: "₺${widget.currency.high}",
                valueColor: customColors?.success,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Zaman Bilgisi
        Row(
          children: [
            // Kapanış Fiyatı
            Expanded(
              child: DetailItem(
                icon: Icons.schedule,
                label: t.currency.details.closing,
                value: "₺${widget.currency.close}",
              ),
            ),
            const SizedBox(width: 16),
            // Son Güncelleme Zamanı
            Expanded(
              child: DetailItem(
                icon: Icons.update,
                label: t.currency.details.lastUpdate,
                value: DateFormatter.formatDateTime(widget.currency.date),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Genişletme göstergesi
  Widget _buildExpandIndicator(ThemeData theme) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Icon(
          Icons.keyboard_arrow_down,
          size: 16,
          color: theme.colorScheme.primary.withOpacity(0.5),
        ),
      ),
    );
  }
}
