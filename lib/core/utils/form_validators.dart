class FormValidators {
  // Email Validator

  static String? fullnameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Fullname is required';
    }
    return null;
  }

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Email format (regex)
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? confirmPasswordValidate(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Re-enter password is required';
    }
    if (value != password) {
      return 'Password does not match';
    }
    return null;
  }
}
