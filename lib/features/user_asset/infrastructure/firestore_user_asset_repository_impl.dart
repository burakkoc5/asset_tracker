import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/features/user_asset/domain/user_asset.dart';
import 'package:asset_tracker/features/user_asset/infrastructure/user_asset_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUserAssetRepositoryImpl extends UserAssetRepository {
  final AuthenticationRepository _authenticationRepository;
  final FirebaseFirestore _firestore;

  FirestoreUserAssetRepositoryImpl(
      this._authenticationRepository, this._firestore);

  @override
  Future<void> createUserAsset(UserAsset userAsset) async {
    if (!await _authenticationRepository.isSignedIn()) {
      throw Exception('User is not signed in');
    }

    try {
      final docRef =
          await _firestore.collection('assets').add(userAsset.toJson());

      // Eğer modelin içinde id alanı varsa, Firestore’un ürettiği id’yi modele de ekleyebilirsin:
      await docRef.update({'id': docRef.id});
    } catch (e) {
      throw Exception('Failed to create user asset: $e');
    }
  }

  @override
  Future<void> deleteUserAsset(UserAsset userAsset) async {
    if (!await _authenticationRepository.isSignedIn()) {
      throw Exception('User is not signed in');
    }
    if (userAsset.id == null || userAsset.id!.isEmpty) {
      throw Exception('Invalid asset ID');
    }

    try {
      await _firestore.collection('assets').doc(userAsset.id).delete();
    } catch (e) {
      throw Exception('Failed to delete user asset: $e');
    }
  }

  @override
  Future<List<UserAsset>> getUserAssets() async {
    if (!await _authenticationRepository.isSignedIn()) {
      return Future.error('User is not signed in');
    }

    final user = _authenticationRepository.getCurrentUser();
    if (user == null) {
      return Future.error('User ID is null');
    }

    try {
      print('Fetching user assets for user: ${user.uid}');
      final querySnapshot = await _firestore
          .collection('assets')
          .where('userId', isEqualTo: user.uid)
          .orderBy('createdAt', descending: true)
          .get();

      print('Fetched ${querySnapshot.size} user assets');
      return querySnapshot.docs.map((doc) {
        final asset = UserAsset.fromJson(doc.data());
        return asset.copyWith(id: doc.id); // Firestore'un ID'sini modele ekle
      }).toList();
    } catch (e) {
      return Future.error('Failed to fetch user assets: $e');
    }
  }

  @override
  Future<void> updateUserAsset(UserAsset userAsset) async {
    if (!await _authenticationRepository.isSignedIn()) {
      throw Exception('User is not signed in');
    }
    if (userAsset.id == null || userAsset.id!.isEmpty) {
      throw Exception('Invalid asset ID');
    }

    try {
      await _firestore
          .collection('assets')
          .doc(userAsset.id)
          .update(userAsset.toJson());
    } catch (e) {
      throw Exception('Failed to update user asset: $e');
    }
  }
}
