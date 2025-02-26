import 'package:asset_tracker/app/widgets/container_button.dart';
import 'package:asset_tracker/core/theme/paddings.dart';
import 'package:asset_tracker/core/utils/form_validators.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_cubit.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/websocket/domain/currency_names.dart';
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
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTypeDropdown(),
            const SizedBox(height: 16),
            _buildAmountField(),
            const SizedBox(height: 16),
            _buildPriceField(),
            const SizedBox(height: 16),
            _buildDatePicker(context),
            const SizedBox(height: 24),
            AppContainerButton.normal(
              center: const Text('Add Asset',
                  style: TextStyle(color: Colors.white)),
              onPressed: () => _submitForm(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedType,
      decoration: InputDecoration(
        labelText: 'Type',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        prefixIcon: const Icon(Icons.category),
      ),
      items: CurrencyNames.names.values
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: (value) => setState(() => _selectedType = value),
      validator: FormValidators.typeValidate,
    );
  }

  Widget _buildAmountField() {
    return TextFormField(
      controller: _amountController,
      decoration: InputDecoration(
        labelText: 'Amount',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        prefixIcon: const Icon(Icons.format_list_numbered),
      ),
      keyboardType: TextInputType.number,
      validator: FormValidators.amountValidate,
    );
  }

  Widget _buildPriceField() {
    return TextFormField(
      controller: _priceController,
      decoration: InputDecoration(
        labelText: 'Price',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        prefixIcon: const Icon(Icons.monetization_on),
      ),
      keyboardType: TextInputType.number,
      validator: FormValidators.priceValidate,
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return InkWell(
      onTap: () async => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Date',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          prefixIcon: const Icon(Icons.calendar_today),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            _selectedDate != null
                ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                : 'Select date',
            style: const TextStyle(fontSize: 16),
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
        type: CurrencyNames.names.values
            .where((element) => element == _selectedType)
            .first,
        amount: int.parse(_amountController.text),
        purchasePrice: double.parse(_priceController.text),
        purchaseDate: _selectedDate!,
        createdAt: DateTime.now().toString(),
      );
      context.read<UserAssetCubit>().createUserAsset(asset);
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }
}
