// ignore_for_file: constant_identifier_names

import 'package:asset_tracker/i18n/strings.g.dart';

enum AuthenticationErrors {
  //Firebase Authentication Error Codes
  ACCOUNT_EXIST("account-exists-with-different-credential"),
  NOT_FOUND("user-not-found"),
  WRONG_PASSWORD("wrong-password"),
  INVALID_EMAIL("invalid-email"),
  USER_DISABLED("user-disabled"),
  REQUEST_QUOTA("too-many-requests"),
  INVALID_CRED("invalid-credential"),
  TIMEOUT("timeout"),
  GENERAL_ERR("general-err");

  const AuthenticationErrors(this.value);

  final String value;

  // Unexpected error message
  static String unexpectedErrorMessage = t.core.errors.unknown;

  // Hata mesajını döndürme fonksiyonu
  static String getErrorMessage(String errorName) {
    AuthenticationErrors errorCode = AuthenticationErrors.values.firstWhere(
      (element) => element.value == errorName,
      orElse: () => AuthenticationErrors.GENERAL_ERR,
    );
    return printMessage(errorCode);
  }

  static String printMessage(AuthenticationErrors errorCode) {
    switch (errorCode) {
      case AuthenticationErrors.ACCOUNT_EXIST:
        return t.core.errors.accountExists;
      case AuthenticationErrors.NOT_FOUND:
        return t.core.errors.notFound;
      case AuthenticationErrors.WRONG_PASSWORD:
        return t.core.errors.wrongPassword;
      case AuthenticationErrors.INVALID_EMAIL:
        return t.core.errors.invalidEmail;
      case AuthenticationErrors.USER_DISABLED:
        return t.core.errors.userDisabled;
      case AuthenticationErrors.REQUEST_QUOTA:
        return t.core.errors.requestQuota;
      case AuthenticationErrors.INVALID_CRED:
        return t.core.errors.invalidCredentials;
      case AuthenticationErrors.TIMEOUT:
        return t.core.errors.timeout;
      case AuthenticationErrors.GENERAL_ERR:
        return unexpectedErrorMessage;
      default:
        return unexpectedErrorMessage;
    }
  }
}
