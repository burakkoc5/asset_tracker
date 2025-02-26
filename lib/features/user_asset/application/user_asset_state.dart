// Cubit State
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';

abstract class UserAssetState {
  const UserAssetState();
  List<Object> get props => [];
}

class UserAssetInitial extends UserAssetState {}

class UserAssetLoading extends UserAssetState {}

class UserAssetLoaded extends UserAssetState {
  final List<UserAsset> userAssets;
  const UserAssetLoaded(this.userAssets);
  @override
  List<Object> get props => [userAssets];
}

class UserAssetError extends UserAssetState {
  final String message;
  const UserAssetError(this.message);
  @override
  List<Object> get props => [message];
}
