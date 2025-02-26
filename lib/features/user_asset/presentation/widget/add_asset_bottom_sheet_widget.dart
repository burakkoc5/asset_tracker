import 'package:asset_tracker/features/user_asset/presentation/widget/add_asset_form.dart';
import 'package:flutter/material.dart';

class AddAssetBottomSheetWidget extends StatefulWidget {
  const AddAssetBottomSheetWidget({super.key});

  @override
  State<AddAssetBottomSheetWidget> createState() =>
      _AddAssetBottomSheetWidgetState();
}

class _AddAssetBottomSheetWidgetState extends State<AddAssetBottomSheetWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        children: [
          AddAssetForm(),
        ],
      ),
    );
  }
}
