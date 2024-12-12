///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsTr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsCoreTr core = _TranslationsCoreTr._(_root);
	@override late final _TranslationsRegistrationTr registration = _TranslationsRegistrationTr._(_root);
}

// Path: core
class _TranslationsCoreTr implements TranslationsCoreEn {
	_TranslationsCoreTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get appName => 'AssetTracker';
}

// Path: registration
class _TranslationsRegistrationTr implements TranslationsRegistrationEn {
	_TranslationsRegistrationTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get welcomeText => 'Hoş geldiniz';
	@override String get termsAndConditionsText => 'Kaydolarak, Kullanım Şartlarımızı kabul etmiş olursunuz';
	@override late final _TranslationsRegistrationFullnameTr fullname = _TranslationsRegistrationFullnameTr._(_root);
	@override late final _TranslationsRegistrationEmailTr email = _TranslationsRegistrationEmailTr._(_root);
	@override late final _TranslationsRegistrationPasswordTr password = _TranslationsRegistrationPasswordTr._(_root);
	@override late final _TranslationsRegistrationConfirmPasswordTr confirmPassword = _TranslationsRegistrationConfirmPasswordTr._(_root);
	@override late final _TranslationsRegistrationSignUpTr signUp = _TranslationsRegistrationSignUpTr._(_root);
	@override late final _TranslationsRegistrationSignInTr signIn = _TranslationsRegistrationSignInTr._(_root);
}

// Path: registration.fullname
class _TranslationsRegistrationFullnameTr implements TranslationsRegistrationFullnameEn {
	_TranslationsRegistrationFullnameTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get fullnameText => 'Tam Ad';
	@override String get fullnameHint => 'Adınızı ve soyadınızı girin';
	@override String get fullnameValidation => 'Tam ad gereklidir';
}

// Path: registration.email
class _TranslationsRegistrationEmailTr implements TranslationsRegistrationEmailEn {
	_TranslationsRegistrationEmailTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get emailText => 'E-posta';
	@override String get emailHint => 'E-posta adresinizi girin';
	@override String get emailValidation => 'E-posta gereklidir';
	@override String get emailInvalid => 'Lütfen geçerli bir e-posta adresi girin';
}

// Path: registration.password
class _TranslationsRegistrationPasswordTr implements TranslationsRegistrationPasswordEn {
	_TranslationsRegistrationPasswordTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get passwordText => 'Şifre';
	@override String get passwordHint => 'Şifrenizi girin';
	@override String get passwordValidation => 'Şifre gereklidir';
	@override String passwordShort({required Object minPasswordSize}) => 'Şifre en az ${minPasswordSize} karakter olmalıdır';
}

// Path: registration.confirmPassword
class _TranslationsRegistrationConfirmPasswordTr implements TranslationsRegistrationConfirmPasswordEn {
	_TranslationsRegistrationConfirmPasswordTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get confirmPasswordText => 'Şifreyi Onayla';
	@override String get confirmPasswordHint => 'Şifrenizi tekrar girin';
	@override String get confirmPasswordValidation => 'Şifreyi tekrar girmeniz gereklidir';
	@override String get confirmPasswordMismatch => 'Şifreler uyuşmuyor';
}

// Path: registration.signUp
class _TranslationsRegistrationSignUpTr implements TranslationsRegistrationSignUpEn {
	_TranslationsRegistrationSignUpTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get signUpText => 'Kayıt ol';
}

// Path: registration.signIn
class _TranslationsRegistrationSignInTr implements TranslationsRegistrationSignInEn {
	_TranslationsRegistrationSignInTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get signInText => 'Giriş Yap';
	@override String get forgotPassword => 'Şifrenizi mi unuttunuz?';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'core.appName': return 'AssetTracker';
			case 'registration.welcomeText': return 'Hoş geldiniz';
			case 'registration.termsAndConditionsText': return 'Kaydolarak, Kullanım Şartlarımızı kabul etmiş olursunuz';
			case 'registration.fullname.fullnameText': return 'Tam Ad';
			case 'registration.fullname.fullnameHint': return 'Adınızı ve soyadınızı girin';
			case 'registration.fullname.fullnameValidation': return 'Tam ad gereklidir';
			case 'registration.email.emailText': return 'E-posta';
			case 'registration.email.emailHint': return 'E-posta adresinizi girin';
			case 'registration.email.emailValidation': return 'E-posta gereklidir';
			case 'registration.email.emailInvalid': return 'Lütfen geçerli bir e-posta adresi girin';
			case 'registration.password.passwordText': return 'Şifre';
			case 'registration.password.passwordHint': return 'Şifrenizi girin';
			case 'registration.password.passwordValidation': return 'Şifre gereklidir';
			case 'registration.password.passwordShort': return ({required Object minPasswordSize}) => 'Şifre en az ${minPasswordSize} karakter olmalıdır';
			case 'registration.confirmPassword.confirmPasswordText': return 'Şifreyi Onayla';
			case 'registration.confirmPassword.confirmPasswordHint': return 'Şifrenizi tekrar girin';
			case 'registration.confirmPassword.confirmPasswordValidation': return 'Şifreyi tekrar girmeniz gereklidir';
			case 'registration.confirmPassword.confirmPasswordMismatch': return 'Şifreler uyuşmuyor';
			case 'registration.signUp.signUpText': return 'Kayıt ol';
			case 'registration.signIn.signInText': return 'Giriş Yap';
			case 'registration.signIn.forgotPassword': return 'Şifrenizi mi unuttunuz?';
			default: return null;
		}
	}
}

