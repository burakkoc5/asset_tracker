import 'package:asset_tracker/i18n/strings.g.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseAuthExceptionExtension on FirebaseAuthException {
  String getErrorMessage() {
    switch (code) {
      case 'account-exists-with-different-credential':
        return t.core.errors.accountExists;
      case 'user-not-found':
        return t.core.errors.notFound;
      case 'wrong-password':
        return t.core.errors.wrongPassword;
      case 'invalid-email':
        return t.core.errors.invalidEmail;
      case 'user-disabled':
        return t.core.errors.userDisabled;
      case 'too-many-requests':
        return t.core.errors.requestQuota;
      case 'invalid-credential':
        return t.core.errors.invalidCredentials;
      case 'timeout':
        return t.core.errors.timeout;
      default:
        return t.core.errors.unknown;
    }
  }
}
