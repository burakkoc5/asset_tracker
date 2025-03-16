import 'package:asset_tracker/features/auth/application/authentication_cubit.dart';
import 'package:asset_tracker/features/auth/application/authentication_state.dart';
import 'package:asset_tracker/features/user_asset/application/user_asset_state.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/user_asset/infrastructure/user_asset_repository.dart';
import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:bloc/bloc.dart';

class UserAssetCubit extends Cubit<UserAssetState> {
  final UserAssetRepository _userAssetRepository;
  final AuthenticationCubit _authenticationCubit;
  UserAssetCubit(this._userAssetRepository, this._authenticationCubit)
      : super(UserAssetInitial());

  void loadUserAssets() async {
    emit(UserAssetLoading());
    try {
      final assets = await _userAssetRepository.getUserAssets();
      emit(UserAssetLoaded(assets));
    } catch (e) {
      emit(UserAssetError(e.toString()));
    }
  }

  void createUserAsset(UserAsset asset) async {
    emit(UserAssetLoading());
    String userId = '';
    final authenticationState = _authenticationCubit.state;

    if (authenticationState is AuthenticationStateAuthenticated) {
      userId = authenticationState.user.uid;
    } else {
      emit(UserAssetError(t.core.errors.invalidCredentials));
      return;
    }

    // Ensure asset is updated with the userId
    final updatedAsset = asset.copyWith(userId: userId);

    try {
      await _userAssetRepository.createUserAsset(updatedAsset);
      loadUserAssets();
    } catch (e) {
      emit(UserAssetError(e.toString()));
    }
  }

  void updateUserAsset(UserAsset asset) async {
    emit(UserAssetLoading());
    try {
      await _userAssetRepository.updateUserAsset(asset);
      loadUserAssets();
    } catch (e) {
      emit(UserAssetError(e.toString()));
    }
  }

  void deleteUserAsset(UserAsset asset) async {
    emit(UserAssetLoading());
    try {
      await _userAssetRepository.deleteUserAsset(asset);
      loadUserAssets();
    } catch (e) {
      emit(UserAssetError(e.toString()));
    }
  }
}
