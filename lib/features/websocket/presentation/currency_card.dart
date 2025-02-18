import 'package:asset_tracker/features/websocket/domain/currency.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatefulWidget {
  CurrencyCard({required this.currency}) : super(key: ValueKey(currency.code));
  final Currency currency;

  @override
  _CurrencyCardState createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard>
    with TickerProviderStateMixin {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAlisUp = widget.currency.dir.alisDir == 'up';
    final isSatisUp = widget.currency.dir.satisDir == 'up';
    final alisColor = isAlisUp ? Colors.green.shade700 : Colors.red.shade700;
    final satisColor = isSatisUp ? Colors.green.shade700 : Colors.red.shade700;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Currency.currencyNames[widget.currency.code] ??
                              widget.currency.code,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              isSatisUp
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: satisColor,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "₺${widget.currency.satis}",
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: satisColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text("${t.currency.details.buy}: "),
                          Row(
                            children: [
                              Icon(
                                isAlisUp
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color: alisColor,
                                size: 12,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "₺${widget.currency.alis}",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: alisColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text("${t.currency.details.sell}: "),
                          Row(
                            children: [
                              Icon(
                                isSatisUp
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                color: satisColor,
                                size: 12,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                "₺${widget.currency.satis}",
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: satisColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: _expanded
                  ? Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color:
                            theme.colorScheme.surfaceVariant.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _DetailRow(
                            label: t.currency.details.lowest,
                            value: "₺${widget.currency.dusuk}",
                            icon: Icons.arrow_downward,
                            color: Colors.red.shade700,
                          ),
                          const SizedBox(height: 8),
                          _DetailRow(
                            label: t.currency.details.highest,
                            value: "₺${widget.currency.yuksek}",
                            icon: Icons.arrow_upward,
                            color: Colors.green.shade700,
                          ),
                          const SizedBox(height: 8),
                          _DetailRow(
                            label: t.currency.details.closing,
                            value: "₺${widget.currency.kapanis}",
                            icon: Icons.schedule,
                          ),
                          const SizedBox(height: 8),
                          _DetailRow(
                            label: t.currency.details.lastUpdate,
                            value: widget.currency.tarih,
                            icon: Icons.update,
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  const _DetailRow({
    required this.label,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: color ?? theme.colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: theme.textTheme.bodyMedium,
        ),
        const Spacer(),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}

enum Direction {
  UP,
  DOWN,
}

extension DirectionExtension on Direction {
  String toJson() {
    switch (this) {
      case Direction.UP:
        return 'up';
      case Direction.DOWN:
        return 'down';
      default:
        return '';
    }
  }

  static Direction fromJson(String json) {
    switch (json) {
      case 'up':
        return Direction.UP;
      case 'down':
        return Direction.DOWN;
      default:
        throw Exception('Unknown direction');
    }
  }
}
