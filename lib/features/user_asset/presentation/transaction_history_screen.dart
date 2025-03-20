import 'package:asset_tracker/features/user_asset/presentation/transaction_history_mixin.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_state.dart';

@RoutePage()
class TransactionHistoryScreen extends StatelessWidget
    with TransactionHistoryMixin {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.userAsset.transactions.title,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
            ],
          ),
        ),
        child: BlocBuilder<UserAssetCubit, UserAssetState>(
          builder: (context, state) {
            if (state is! UserAssetLoaded) {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.colorScheme.primary,
                ),
              );
            }

            final transactions = state.userAssets;

            if (transactions.isEmpty) {
              return buildEmptyTransactions(context);
            }

            return buildTransactionsList(context, transactions);
          },
        ),
      ),
    );
  }
}
