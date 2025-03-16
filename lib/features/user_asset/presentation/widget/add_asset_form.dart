import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/currency_utils.dart';
import 'package:asset_tracker/core/utils/date_formatter.dart';
import 'package:asset_tracker/core/utils/form_decorations.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAssetForm extends StatefulWidget {
  const AddAssetForm({super.key});

  @override
  State<AddAssetForm> createState() => _AddAssetFormState();
}

class _AddAssetFormState extends State<AddAssetForm> {
  final formKey = GlobalKey<FormState>();
  String? _selectedType;
  final _amountController = TextEditingController();
  final _priceController = TextEditingController();
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: Paddings.md.all,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme),
          Paddings.md.vertical,
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTypeDropdown(theme),
                    _buildAmountField(theme),
                    _buildPriceField(theme),
                    _buildDatePicker(context, theme),
                    Paddings.lg.vertical,
                    _buildSubmitButton(theme),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Column(
      children: [
        // Form indicator line
        Center(
          child: Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: Radiuses.xxs.all,
            ),
          ),
        ),
        Paddings.md.vertical,
        // Form title
        Center(
          child: Text(
            t.userAsset.addAsset.title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTypeDropdown(ThemeData theme) {
    // Filter purchasable assets
    final Map<String, String> purchasableAssets =
        CurrencyUtils.filterPurchasableAssets(CurrencyUtils.getLocalizedNames);

    return FormDecorations.buildFieldWrapper(
      child: DropdownButtonFormField<String>(
        value: _selectedType,
        decoration: FormDecorations.inputDecoration(
          theme: theme,
          label: t.userAsset.addAsset.fields.type,
          icon: Icons.category_outlined,
        ),
        items: purchasableAssets.keys
            .map((key) => DropdownMenuItem(
                  value: key, // Use the key (asset code) as the value
                  child: Text(
                    purchasableAssets[key]!, // Display the localized name
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ))
            .toList(),
        onChanged: (value) => setState(() => _selectedType = value),
        validator: FormValidators.typeValidate,
        icon: Icon(
          Icons.arrow_drop_down,
          color: theme.colorScheme.primary,
        ),
        dropdownColor: theme.colorScheme.surface,
        borderRadius: Radiuses.md.all,
      ),
    );
  }

  Widget _buildAmountField(ThemeData theme) {
    return FormDecorations.buildFieldWrapper(
      child: TextFormField(
        controller: _amountController,
        decoration: FormDecorations.inputDecoration(
          theme: theme,
          label: t.userAsset.addAsset.fields.amount,
          icon: Icons.format_list_numbered_outlined,
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: false),
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        validator: FormValidators.amountValidate,
      ),
    );
  }

  Widget _buildPriceField(ThemeData theme) {
    return FormDecorations.buildFieldWrapper(
      child: TextFormField(
        controller: _priceController,
        decoration: FormDecorations.inputDecoration(
          theme: theme,
          label: t.userAsset.addAsset.fields.price,
          icon: Icons.monetization_on_outlined,
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        validator: FormValidators.priceValidate,
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, ThemeData theme) {
    return FormDecorations.buildFieldWrapper(
      child: InkWell(
        onTap: () async => _selectDate(context),
        child: InputDecorator(
          decoration: FormDecorations.inputDecoration(
            theme: theme,
            label: t.userAsset.addAsset.fields.date,
            icon: Icons.calendar_today_outlined,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedDate != null
                      ? DateFormatter.formatDate(_selectedDate!)
                      : t.userAsset.addAsset.datePicker.label,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: _selectedDate != null
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(ThemeData theme) {
    return ElevatedButton(
      onPressed: () => _submitForm(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: Radiuses.md.all,
        ),
        elevation: 2,
      ),
      child: Text(
        t.userAsset.addAsset.title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await DateFormatter.showAppDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _submitForm(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final asset = UserAsset(
        type: _selectedType!,
        amount: int.parse(_amountController.text),
        purchasePrice: double.parse(_priceController.text),
        purchaseDate: _selectedDate!,
        createdAt: DateTime.now().toString(),
      );
      context.read<UserAssetCubit>().createUserAsset(asset);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.userAsset.addAsset.errorMessage)),
      );
    }
  }
}
