///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final TranslationsCoreEn core = TranslationsCoreEn._(_root);
	late final TranslationsRegistrationEn registration = TranslationsRegistrationEn._(_root);
}

// Path: core
class TranslationsCoreEn {
	TranslationsCoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appName => 'AssetTracker';
}

// Path: registration
class TranslationsRegistrationEn {
	TranslationsRegistrationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get welcomeText => 'Welcome';
	String get termsAndConditionsText => 'By signing up, you agree to our Terms and Conditions';
	late final TranslationsRegistrationFullnameEn fullname = TranslationsRegistrationFullnameEn._(_root);
	late final TranslationsRegistrationEmailEn email = TranslationsRegistrationEmailEn._(_root);
	late final TranslationsRegistrationPasswordEn password = TranslationsRegistrationPasswordEn._(_root);
	late final TranslationsRegistrationConfirmPasswordEn confirmPassword = TranslationsRegistrationConfirmPasswordEn._(_root);
	late final TranslationsRegistrationSignUpEn signUp = TranslationsRegistrationSignUpEn._(_root);
	late final TranslationsRegistrationSignInEn signIn = TranslationsRegistrationSignInEn._(_root);
}

// Path: registration.fullname
class TranslationsRegistrationFullnameEn {
	TranslationsRegistrationFullnameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fullnameText => 'Full Name';
	String get fullnameHint => 'Enter your full name';
	String get fullnameValidation => 'Fullname is required';
}

// Path: registration.email
class TranslationsRegistrationEmailEn {
	TranslationsRegistrationEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get emailText => 'Email';
	String get emailHint => 'Enter your email';
	String get emailValidation => 'Email is required';
	String get emailInvalid => 'Please enter a valid email';
}

// Path: registration.password
class TranslationsRegistrationPasswordEn {
	TranslationsRegistrationPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get passwordText => 'Password';
	String get passwordHint => 'Enter your password';
	String get passwordValidation => 'Password is required';
	String passwordShort({required Object minPasswordSize}) => 'Password must be at least ${minPasswordSize} characters';
}

// Path: registration.confirmPassword
class TranslationsRegistrationConfirmPasswordEn {
	TranslationsRegistrationConfirmPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get confirmPasswordText => 'Confirm Password';
	String get confirmPasswordHint => 'Re-enter your password';
	String get confirmPasswordValidation => 'Re-enter password is required';
	String get confirmPasswordMismatch => 'Password does not match';
}

// Path: registration.signUp
class TranslationsRegistrationSignUpEn {
	TranslationsRegistrationSignUpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get signUpText => 'Sign Up';
}

// Path: registration.signIn
class TranslationsRegistrationSignInEn {
	TranslationsRegistrationSignInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get signInText => 'Sign In';
	String get forgotPassword => 'Forgot Password?';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'core.appName': return 'AssetTracker';
			case 'registration.welcomeText': return 'Welcome';
			case 'registration.termsAndConditionsText': return 'By signing up, you agree to our Terms and Conditions';
			case 'registration.fullname.fullnameText': return 'Full Name';
			case 'registration.fullname.fullnameHint': return 'Enter your full name';
			case 'registration.fullname.fullnameValidation': return 'Fullname is required';
			case 'registration.email.emailText': return 'Email';
			case 'registration.email.emailHint': return 'Enter your email';
			case 'registration.email.emailValidation': return 'Email is required';
			case 'registration.email.emailInvalid': return 'Please enter a valid email';
			case 'registration.password.passwordText': return 'Password';
			case 'registration.password.passwordHint': return 'Enter your password';
			case 'registration.password.passwordValidation': return 'Password is required';
			case 'registration.password.passwordShort': return ({required Object minPasswordSize}) => 'Password must be at least ${minPasswordSize} characters';
			case 'registration.confirmPassword.confirmPasswordText': return 'Confirm Password';
			case 'registration.confirmPassword.confirmPasswordHint': return 'Re-enter your password';
			case 'registration.confirmPassword.confirmPasswordValidation': return 'Re-enter password is required';
			case 'registration.confirmPassword.confirmPasswordMismatch': return 'Password does not match';
			case 'registration.signUp.signUpText': return 'Sign Up';
			case 'registration.signIn.signInText': return 'Sign In';
			case 'registration.signIn.forgotPassword': return 'Forgot Password?';
			default: return null;
		}
	}
}

