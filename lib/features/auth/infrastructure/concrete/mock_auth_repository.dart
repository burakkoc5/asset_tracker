import 'dart:async';
import 'package:asset_tracker/features/auth/infrastructure/abstract/authentication_repository.dart';
import 'package:asset_tracker/i18n/strings.g.dart';

class MockAuthRepositoryImpl extends AuthenticationRepository {
  static const _defaultDelay = Duration(seconds: 1);
  static const _shortDelay = Duration(milliseconds: 500);
  // Örnek kullanıcı veritabanı (Firebase yerine local bir liste kullanıyoruz)
  final Map<String, String> _mockUsers = {
    "test@example.com": "password123",
    "user@domain.com": "securePass",
  };

  String? _currentUser;

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    return Future.delayed(_defaultDelay, () {
      if (_mockUsers.containsKey(email) && _mockUsers[email] == password) {
        _currentUser = email; // Kullanıcıyı oturum açmış olarak kaydet
        return;
      } else {
        throw Exception(t.core.errors.invalidCredentials);
      }
    });
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    return Future.delayed(_defaultDelay, () {
      if (_mockUsers.containsKey(email)) {
        throw Exception(t.core.errors.accountExists);
      }
      _mockUsers[email] = password;
    });
  }

  @override
  Future<void> signOut() async {
    return Future.delayed(_shortDelay, () {
      _currentUser = null; // Kullanıcıyı oturumdan çıkar
    });
  }

  String? getCurrentUser() {
    return _currentUser;
  }
}
