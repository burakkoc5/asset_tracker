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
	late final TranslationsSocketEn socket = TranslationsSocketEn._(_root);
	late final TranslationsCurrencyEn currency = TranslationsCurrencyEn._(_root);
	late final TranslationsRegistrationEn registration = TranslationsRegistrationEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
}

// Path: core
class TranslationsCoreEn {
	TranslationsCoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appName => 'AssetTracker';
	late final TranslationsCoreErrorsEn errors = TranslationsCoreErrorsEn._(_root);
}

// Path: socket
class TranslationsSocketEn {
	TranslationsSocketEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSocketStatusEn status = TranslationsSocketStatusEn._(_root);
	late final TranslationsSocketLogsEn logs = TranslationsSocketLogsEn._(_root);
}

// Path: currency
class TranslationsCurrencyEn {
	TranslationsCurrencyEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsCurrencyDetailsEn details = TranslationsCurrencyDetailsEn._(_root);
	late final TranslationsCurrencyTimeEn time = TranslationsCurrencyTimeEn._(_root);
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
	late final TranslationsRegistrationSignOutEn signOut = TranslationsRegistrationSignOutEn._(_root);
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Asset Tracker';
	String get initializing => 'Initializing...';
	String get disconnected => 'Disconnected';
	String get connected => 'Connected';
}

// Path: core.errors
class TranslationsCoreErrorsEn {
	TranslationsCoreErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get accountExists => 'This email address is already in use';
	String get invalidCredentials => 'Invalid email or password';
	String get notFound => 'User not found';
	String get invalidEmail => 'Invalid email address';
	String get wrongPassword => 'Incorrect password';
	String get userDisabled => 'User has been disabled';
	String get timeout => 'Request timed out. Please try again later';
	String get unknown => 'An unknown error occurred';
	String get requestQuota => 'Too many login attempts. Please try again later';
	String socketConnection({required Object error, required Object current, required Object max}) => 'Connection error: ${error}\nRetrying ${current}/${max}';
	String get maxRetryReached => 'Maximum connection attempts reached. Please try again later';
	String get socketDisconnected => 'Connection lost. Showing last available data...';
}

// Path: socket.status
class TranslationsSocketStatusEn {
	TranslationsSocketStatusEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get connecting => 'Connecting...';
	String get connected => 'Connected';
	String get disconnected => 'Disconnected';
	String error({required Object message}) => 'Error: ${message}';
}

// Path: socket.logs
class TranslationsSocketLogsEn {
	TranslationsSocketLogsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get handshakeReceived => 'Handshake received, sending subscribe message';
	String get initialDataReceived => 'Initial data received';
	String get dataUpdated => 'Data updated';
	String get connectionClosed => 'Socket connection closed';
	String get tryingResubscribe => 'Trying to resubscribe...';
	String get connectionLost => 'Connection lost, attempting to reconnect...';
	String get cannotSendMessage => 'Cannot send message: socket is not connected';
	String jsonParseError({required Object error}) => 'Error parsing JSON data: ${error}';
	String oldCurrencyLog({required Object currency}) => 'Old Currency: ${currency}';
	String receivedData({required Object data}) => 'Received data: ${data}';
}

// Path: currency.details
class TranslationsCurrencyDetailsEn {
	TranslationsCurrencyDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get buy => 'Buy';
	String get sell => 'Sell';
	String get lowest => 'Lowest';
	String get highest => 'Highest';
	String get closing => 'Closing';
	String get lastUpdate => 'Last Update';
	String lastUpdateTime({required Object time}) => '${time} ago';
}

// Path: currency.time
class TranslationsCurrencyTimeEn {
	TranslationsCurrencyTimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String seconds({required Object count}) => '${count} seconds';
	String minutes({required Object count}) => '${count} minutes';
	String hours({required Object count}) => '${count} hours';
	String days({required Object count}) => '${count} days';
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

// Path: registration.signOut
class TranslationsRegistrationSignOutEn {
	TranslationsRegistrationSignOutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get signOutText => 'Sign Out';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'core.appName': return 'AssetTracker';
			case 'core.errors.accountExists': return 'This email address is already in use';
			case 'core.errors.invalidCredentials': return 'Invalid email or password';
			case 'core.errors.notFound': return 'User not found';
			case 'core.errors.invalidEmail': return 'Invalid email address';
			case 'core.errors.wrongPassword': return 'Incorrect password';
			case 'core.errors.userDisabled': return 'User has been disabled';
			case 'core.errors.timeout': return 'Request timed out. Please try again later';
			case 'core.errors.unknown': return 'An unknown error occurred';
			case 'core.errors.requestQuota': return 'Too many login attempts. Please try again later';
			case 'core.errors.socketConnection': return ({required Object error, required Object current, required Object max}) => 'Connection error: ${error}\nRetrying ${current}/${max}';
			case 'core.errors.maxRetryReached': return 'Maximum connection attempts reached. Please try again later';
			case 'core.errors.socketDisconnected': return 'Connection lost. Showing last available data...';
			case 'socket.status.connecting': return 'Connecting...';
			case 'socket.status.connected': return 'Connected';
			case 'socket.status.disconnected': return 'Disconnected';
			case 'socket.status.error': return ({required Object message}) => 'Error: ${message}';
			case 'socket.logs.handshakeReceived': return 'Handshake received, sending subscribe message';
			case 'socket.logs.initialDataReceived': return 'Initial data received';
			case 'socket.logs.dataUpdated': return 'Data updated';
			case 'socket.logs.connectionClosed': return 'Socket connection closed';
			case 'socket.logs.tryingResubscribe': return 'Trying to resubscribe...';
			case 'socket.logs.connectionLost': return 'Connection lost, attempting to reconnect...';
			case 'socket.logs.cannotSendMessage': return 'Cannot send message: socket is not connected';
			case 'socket.logs.jsonParseError': return ({required Object error}) => 'Error parsing JSON data: ${error}';
			case 'socket.logs.oldCurrencyLog': return ({required Object currency}) => 'Old Currency: ${currency}';
			case 'socket.logs.receivedData': return ({required Object data}) => 'Received data: ${data}';
			case 'currency.details.buy': return 'Buy';
			case 'currency.details.sell': return 'Sell';
			case 'currency.details.lowest': return 'Lowest';
			case 'currency.details.highest': return 'Highest';
			case 'currency.details.closing': return 'Closing';
			case 'currency.details.lastUpdate': return 'Last Update';
			case 'currency.details.lastUpdateTime': return ({required Object time}) => '${time} ago';
			case 'currency.time.seconds': return ({required Object count}) => '${count} seconds';
			case 'currency.time.minutes': return ({required Object count}) => '${count} minutes';
			case 'currency.time.hours': return ({required Object count}) => '${count} hours';
			case 'currency.time.days': return ({required Object count}) => '${count} days';
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
			case 'registration.signOut.signOutText': return 'Sign Out';
			case 'home.title': return 'Asset Tracker';
			case 'home.initializing': return 'Initializing...';
			case 'home.disconnected': return 'Disconnected';
			case 'home.connected': return 'Connected';
			default: return null;
		}
	}
}

