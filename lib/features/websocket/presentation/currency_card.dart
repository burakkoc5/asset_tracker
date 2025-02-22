import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/features/websocket/domain/currency.dart';
import 'package:asset_tracker/features/websocket/presentation/widgets/detail_row.dart';
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

  Widget _buildMainInfo(BuildContext context, bool isAlisUp, bool isSatisUp,
      Color alisColor, Color satisColor) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCurrencyTitle(context),
              Paddings.xs.vertical,
              _buildPriceInfo(context, isSatisUp, satisColor),
            ],
          ),
        ),
        _buildBuySellInfo(context, isAlisUp, isSatisUp, alisColor, satisColor),
        const SizedBox(width: 8),
        Icon(
          _expanded ? Icons.expand_less : Icons.expand_more,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  Widget _buildCurrencyTitle(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          Currency.currencyNames[widget.currency.code] ?? widget.currency.code,
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
        Paddings.xs.horizontal,
        Text(
          '(${widget.currency.code})',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        if (widget.currency.dir.isDown)
          const Icon(Icons.arrow_downward, color: Colors.red, size: 16),
        if (widget.currency.dir.isUp)
          const Icon(Icons.arrow_upward, color: Colors.green, size: 16),
      ],
    );
  }

  Widget _buildPriceInfo(
      BuildContext context, bool isSatisUp, Color satisColor) {
    return Row(
      children: [
        Icon(
          isSatisUp ? Icons.arrow_upward : Icons.arrow_downward,
          color: satisColor,
          size: 16,
        ),
        const SizedBox(width: 4),
        Text(
          "₺${widget.currency.sell}",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: satisColor,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }

  Widget _buildBuySellInfo(BuildContext context, bool isAlisUp, bool isSatisUp,
      Color alisColor, Color satisColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildPriceRow(context, t.currency.details.buy, widget.currency.buy,
            isAlisUp, alisColor),
        Paddings.xxs.vertical,
        _buildPriceRow(context, t.currency.details.sell, widget.currency.sell,
            isSatisUp, satisColor),
      ],
    );
  }

  Widget _buildPriceRow(BuildContext context, String label, String value,
      bool isUp, Color color) {
    return Row(
      children: [
        Text("$label: "),
        Row(
          children: [
            Icon(
              isUp ? Icons.arrow_upward : Icons.arrow_downward,
              color: color,
              size: 12,
            ),
            const SizedBox(width: 2),
            Text(
              "₺$value",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpandedInfo(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: Paddings.md.all,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailRow(
            label: t.currency.details.lowest,
            value: "₺${widget.currency.low}",
            icon: Icons.arrow_downward,
            color: Colors.red.shade700,
          ),
          Paddings.xs.vertical,
          DetailRow(
            label: t.currency.details.highest,
            value: "₺${widget.currency.high}",
            icon: Icons.arrow_upward,
            color: Colors.green.shade700,
          ),
          Paddings.xs.vertical,
          DetailRow(
            label: t.currency.details.closing,
            value: "₺${widget.currency.close}",
            icon: Icons.schedule,
          ),
          Paddings.xs.vertical,
          DetailRow(
            label: t.currency.details.lastUpdate,
            value: widget.currency.date,
            icon: Icons.update,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAlisUp = widget.currency.dir.buyDirection == 'up';
    final isSatisUp = widget.currency.dir.sellDirection == 'up';
    final alisColor = isAlisUp ? Colors.green.shade700 : Colors.red.shade700;
    final satisColor = isSatisUp ? Colors.green.shade700 : Colors.red.shade700;

    return Card(
      margin: Paddings.xxs.all,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            _expanded = !_expanded;
          });
        },
        child: Column(
          children: [
            Padding(
              padding: Paddings.md.all,
              child: _buildMainInfo(
                  context, isAlisUp, isSatisUp, alisColor, satisColor),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: _expanded
                  ? _buildExpandedInfo(context)
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
