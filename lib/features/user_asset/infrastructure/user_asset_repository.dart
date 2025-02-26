import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';

abstract class UserAssetRepository {
  Future<void> createUserAsset(UserAsset userAsset);
  Future<void> updateUserAsset(UserAsset userAsset);
  Future<void> deleteUserAsset(UserAsset userAsset);
  Future<List<UserAsset>> getUserAssets();
}
