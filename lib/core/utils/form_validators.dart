import 'package:asset_tracker/app/constants/app_constants.dart';
import 'package:asset_tracker/i18n/strings.g.dart';

class FormValidators {
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

  static String? typeValidate(String? value) {
    if (value == null) {
      return 'Please select a type';
    }
    return null;
  }

  static String? amountValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter amount';
    }
    if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'Please enter a valid amount';
    }
    return null;
  }

  static String? priceValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter price';
    }
    if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'Please enter a valid price';
    }
    return null;
  }
}
