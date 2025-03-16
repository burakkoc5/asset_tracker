import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/user_asset/presentation/widget/transaction_card.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

mixin TransactionHistoryMixin<T extends StatelessWidget> {
  Widget buildEmptyTransactions(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: Paddings.lg.all,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.history,
              size: 64,
              color: theme.colorScheme.primary.withOpacity(0.7),
            ),
          ),
          Paddings.md.vertical,
          Text(
            t.userAsset.transactions.empty,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          Paddings.sm.vertical,
          Text(
            t.userAsset.transactions.emptyMessage,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTransactionsList(
      BuildContext context, List<UserAsset> transactions) {
    final theme = Theme.of(context);

    // Sort transactions by purchase date (newest first)
    transactions.sort((a, b) => b.purchaseDate!.compareTo(a.purchaseDate!));

    return ListView.builder(
      padding: Paddings.md.all,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        final bool isFirst = index == 0;
        final bool isLast = index == transactions.length - 1;

        // Get current locale for date formatting
        final currentLocale = LocaleSettings.currentLocale.languageCode;

        // Group transactions by month and year
        final dateFormatter = DateFormat('MMMM yyyy', currentLocale);
        final currentDate = dateFormatter.format(transaction.purchaseDate!);
        final previousDate = index > 0
            ? dateFormatter.format(transactions[index - 1].purchaseDate!)
            : null;

        final bool isNewMonth = index == 0 || currentDate != previousDate;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isNewMonth) ...[
              Padding(
                padding: EdgeInsets.only(
                    left: 16, top: isFirst ? 0 : 24, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentDate,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 2,
                      width: 32,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: Radiuses.xxs.all,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            TransactionCard(transaction: transaction),
            if (!isLast) Paddings.sm.vertical,
          ],
        );
      },
    );
  }
}
