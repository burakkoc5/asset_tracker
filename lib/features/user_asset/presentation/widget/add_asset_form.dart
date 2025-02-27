import 'package:asset_tracker/app/widgets/container_button.dart';
import 'package:asset_tracker/core/theme/app_theme.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/theme/radiuses.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/websocket/domain/currency_names.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
    return Padding(
      padding: Paddings.sm.all,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: Radiuses.sm.all,
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTypeDropdown(),
                _buildAmountField(),
                _buildPriceField(),
                _buildDatePicker(context),
                Paddings.sm.vertical,
                AppContainerButton.normal(
                  center: Text(t.userAsset.addAsset.title,
                      style: TextStyle(
                          color: Theme.of(context)
                              .extension<CustomAppColors>()
                              ?.white,
                          fontWeight: FontWeight.bold)),
                  onPressed: () => _submitForm(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeDropdown() {
    return _buildFieldWrapper(
      child: DropdownButtonFormField<String>(
        value: _selectedType,
        decoration:
            _inputDecoration(t.userAsset.addAsset.fields.type, Icons.category),
        items: CurrencyNames.names.values
            .map((type) => DropdownMenuItem(value: type, child: Text(type)))
            .toList(),
        onChanged: (value) => setState(() => _selectedType = value),
        validator: FormValidators.typeValidate,
      ),
    );
  }

  Widget _buildAmountField() {
    return _buildFieldWrapper(
      child: TextFormField(
        controller: _amountController,
        decoration: _inputDecoration(
            t.userAsset.addAsset.fields.amount, Icons.format_list_numbered),
        keyboardType: TextInputType.number,
        validator: FormValidators.amountValidate,
      ),
    );
  }

  Widget _buildPriceField() {
    return _buildFieldWrapper(
      child: TextFormField(
        controller: _priceController,
        decoration: _inputDecoration(
            t.userAsset.addAsset.fields.price, Icons.monetization_on),
        keyboardType: TextInputType.number,
        validator: FormValidators.priceValidate,
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return _buildFieldWrapper(
      child: InkWell(
        onTap: () async => _selectDate(context),
        child: InputDecorator(
          decoration: _inputDecoration(
              t.userAsset.addAsset.fields.date, Icons.calendar_today),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              _selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                  : t.userAsset.addAsset.datePicker.label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
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

  Widget _buildFieldWrapper({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: child,
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: Radiuses.sm.all,
      ),
      prefixIcon: Icon(icon),
    );
  }
}
