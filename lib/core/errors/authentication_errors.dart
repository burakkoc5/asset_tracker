// ignore_for_file: constant_identifier_names

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
  static String unexpectedErrorMessage = 'Beklenmeyen bir hata oluştu.';

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
        return 'Hesap başka bir kimlik ile mevcut.';
      case AuthenticationErrors.NOT_FOUND:
        return 'Kullanıcı bulunamadı.';
      case AuthenticationErrors.WRONG_PASSWORD:
        return 'Girilen şifre yanlış.';
      case AuthenticationErrors.INVALID_EMAIL:
        return 'Geçersiz e-posta adresi.';
      case AuthenticationErrors.USER_DISABLED:
        return 'Kullanıcı engellenmiş.';
      case AuthenticationErrors.REQUEST_QUOTA:
        return 'Çok fazla giriş denemesi yapıldı.';
      case AuthenticationErrors.INVALID_CRED:
        return 'Geçersiz kimlik bilgileri.';
      case AuthenticationErrors.TIMEOUT:
        return 'İstek zaman aşımına uğradı.';
      case AuthenticationErrors.GENERAL_ERR:
        return 'Bilinmeyen bir hata oluştu.';
      default:
        return 'Bilinmeyen bir hata oluştu.';
    }
  }
}
