import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/date_formatter.dart';
import 'package:asset_tracker/core/utils/form_decorations.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTransactionForm extends StatefulWidget {
  final UserAsset asset;

  const EditTransactionForm({super.key, required this.asset});

  @override
  State<EditTransactionForm> createState() => _EditTransactionFormState();
}

class _EditTransactionFormState extends State<EditTransactionForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _amountController;
  late TextEditingController _priceController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _amountController =
        TextEditingController(text: widget.asset.amount.toString());
    _priceController =
        TextEditingController(text: widget.asset.purchasePrice.toString());
    _selectedDate = widget.asset.purchaseDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  // Tarih seçici diyalog
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await DateFormatter.showAppDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Calculate size to handle keyboard
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(
        left: Paddings.sm.value,
        right: Paddings.sm.value,
        top: Paddings.sm.value,
        bottom: bottomInset + Paddings.sm.value,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: Radiuses.xxs.all,
              ),
            ),
          ),
          Paddings.sm.vertical,
          // Title
          Center(
            child: Text(
              t.userAsset.assetDetails.editTransaction,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Paddings.sm.vertical,
          // Form
          Form(
            key: _formKey,
            child: Column(
              children: [
                // Amount
                TextFormField(
                  controller: _amountController,
                  decoration: FormDecorations.inputDecoration(
                    theme: theme,
                    label: t.userAsset.assetDetails.amount,
                    icon: Icons.format_list_numbered,
                  ),
                  keyboardType: TextInputType.number,
                  validator: FormValidators.amountValidate,
                ),
                Paddings.sm.vertical,
                // Price
                TextFormField(
                  controller: _priceController,
                  decoration: FormDecorations.inputDecoration(
                    theme: theme,
                    label: t.userAsset.addAsset.fields.price,
                    icon: Icons.monetization_on,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator: FormValidators.priceValidate,
                ),
                Paddings.sm.vertical,
                // Date picker
                InkWell(
                  onTap: () async => _selectDate(context),
                  child: InputDecorator(
                    decoration: FormDecorations.inputDecoration(
                      theme: theme,
                      label: t.userAsset.addAsset.fields.date,
                      icon: Icons.calendar_today,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormatter.formatDate(_selectedDate),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: theme.colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                Paddings.sm.vertical,
                // Submit button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      foregroundColor: theme.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: Radiuses.md.all,
                      ),
                    ),
                    child: Text(
                      t.userAsset.assetDetails.save,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Create updated asset
      final updatedAsset = widget.asset.copyWith(
        amount: int.parse(_amountController.text),
        purchasePrice: double.parse(_priceController.text),
        purchaseDate: _selectedDate,
      );

      // Update using cubit
      context.read<UserAssetCubit>().updateUserAsset(updatedAsset);
      Navigator.pop(context);
    }
  }
}
