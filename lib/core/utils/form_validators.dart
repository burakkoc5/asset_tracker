import 'package:asset_tracker/app/constants/app_constants.dart';
import 'package:asset_tracker/i18n/strings.g.dart';

class FormValidators {
  // Email Validator

  static String? fullnameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return t.registration.fullname.fullnameValidation;
    }
    return null;
  }

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return t.registration.email.emailValidation;
    }
    // Email format (regex)
    final emailRegex = RegExp(AppConstants.emailRegex);
    if (!emailRegex.hasMatch(value)) {
      return t.registration.email.emailInvalid;
    }

    return null;
  }

  static String? passwordValidate(String? value) {
    int passwordMinLength = AppConstants.passwordMinLength;

    if (value == null || value.isEmpty) {
      return t.registration.password.passwordValidation;
    } else if (value.length < passwordMinLength) {
      return t.registration.password
          .passwordShort(minPasswordSize: passwordMinLength);
    }
    return null;
  }

  static String? confirmPasswordValidate(String? value, String password) {
    if (value == null || value.isEmpty) {
      return t.registration.confirmPassword.confirmPasswordValidation;
    }
    if (value != password) {
      return t.registration.confirmPassword.confirmPasswordMismatch;
    }
    return null;
  }
}
