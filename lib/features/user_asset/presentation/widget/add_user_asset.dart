import 'package:asset_tracker/app/widgets/bottom_sheet.dart';
import 'package:asset_tracker/features/user_asset/presentation/widget/add_asset_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

FloatingActionButton buildAddUserAssetButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      CustomBottomSheet.show(context, child: const AddAssetBottomSheetWidget());
    },
    child: const Icon(Icons.add),
  );
}
