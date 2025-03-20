import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/currency_utils.dart';
import 'package:asset_tracker/core/utils/date_formatter.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/user_asset/presentation/widget/edit_transaction_form.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final UserAsset transaction;

  const TransactionCard({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = Theme.of(context).extension<CustomAppColors>();

    final purchaseTotal = transaction.purchasePrice * transaction.amount;

    // Get current locale for formatting
    final currentLocale = LocaleSettings.currentLocale.languageCode;

    // Format currency values
    final currencyFormatter = NumberFormat('#,##0.00', currentLocale);
    final formattedPurchaseTotal = currencyFormatter.format(purchaseTotal);
    final formattedPurchasePrice =
        currencyFormatter.format(transaction.purchasePrice);

    // Format dates using DateFormatter utility
    final transactionDate = transaction.purchaseDate != null
        ? DateFormatter.formatDate(transaction.purchaseDate!,
            format: 'dd MMM yyyy HH:mm')
        : '';

    final day = transaction.purchaseDate != null
        ? DateFormatter.formatDate(transaction.purchaseDate!, format: 'dd')
        : '';

    final month = transaction.purchaseDate != null
        ? DateFormatter.formatDate(transaction.purchaseDate!, format: 'MMM')
        : '';

    return Card(
      margin: EdgeInsets.zero,
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
        onTap: () {},
        borderRadius: Radiuses.md.all,
        child: Padding(
          padding: Paddings.md.all,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date column with visual indicator
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: Radiuses.sm.all,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              day,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            Text(
                              month,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Paddings.sm.horizontal,
                  // Transaction details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    CurrencyUtils.getLocalizedName(
                                        transaction.type),
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: Paddings.xxs.only(top: true),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 14,
                                          color: theme
                                              .colorScheme.onSurfaceVariant,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          transactionDate,
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                            color: theme
                                                .colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "₺$formattedPurchaseTotal",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: customColors?.success,
                                  ),
                                ),
                                Paddings.xxs.vertical,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Paddings.xxs.value,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        customColors?.success.withOpacity(0.1),
                                    borderRadius: Radiuses.xxs.all,
                                  ),
                                  child: Text(
                                    "${transaction.amount} ${transaction.amount == 1 ? t.general.unit : t.general.units}",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: customColors?.success,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Paddings.xs.vertical,
                        const Divider(),
                        Paddings.xxs.vertical,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            detailItem(
                              context,
                              Icons.price_change,
                              t.userAsset.assetDetails.purchasePrice,
                              "₺$formattedPurchasePrice",
                            ),
                            detailItem(
                              context,
                              Icons.inventory,
                              t.userAsset.assetDetails.amount,
                              transaction.amount.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Action Buttons
              Padding(
                padding: Paddings.sm.only(top: true),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Edit Button
                    OutlinedButton.icon(
                      onPressed: () => _showEditDialog(context),
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                      label: Text(
                        t.userAsset.assetDetails.edit,
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 14,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: Paddings.xs.all,
                        shape: RoundedRectangleBorder(
                          borderRadius: Radiuses.sm.all,
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Paddings.xxs.horizontal,
                    // Delete Button
                    OutlinedButton.icon(
                      onPressed: () => _showDeleteConfirmation(context, theme),
                      icon: Icon(
                        Icons.delete_outline,
                        size: 18,
                        color: theme.colorScheme.error,
                      ),
                      label: Text(
                        t.userAsset.assetDetails.delete,
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontSize: 14,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: Paddings.xs.all,
                        shape: RoundedRectangleBorder(
                          borderRadius: Radiuses.sm.all,
                        ),
                        side: BorderSide(
                          color: theme.colorScheme.error.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: theme.colorScheme.primary.withOpacity(0.7),
        ),
        Paddings.xxs.horizontal,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDeleteConfirmation(BuildContext context, ThemeData theme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.userAsset.assetDetails.deleteConfirmTitle),
        content: Text(t.userAsset.assetDetails.deleteConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              t.general.cancel,
              style: TextStyle(color: theme.colorScheme.primary),
            ),
          ),
          TextButton(
            onPressed: () {
              // Delete the transaction
              context.read<UserAssetCubit>().deleteUserAsset(transaction);
              Navigator.of(context).pop();
            },
            child: Text(
              t.userAsset.assetDetails.delete,
              style: TextStyle(color: theme.colorScheme.error),
            ),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditTransactionForm(asset: transaction),
    );
  }
}
