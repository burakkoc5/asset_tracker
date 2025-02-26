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
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsUserAssetEn userAsset = TranslationsUserAssetEn._(_root);
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
	late final TranslationsCurrencySearchEn search = TranslationsCurrencySearchEn._(_root);
	late final TranslationsCurrencyTimeEn time = TranslationsCurrencyTimeEn._(_root);
	late final TranslationsCurrencyNamesEn names = TranslationsCurrencyNamesEn._(_root);
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

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Profile';
}

// Path: userAsset
class TranslationsUserAssetEn {
	TranslationsUserAssetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsUserAssetPortfolioEn portfolio = TranslationsUserAssetPortfolioEn._(_root);
	late final TranslationsUserAssetAssetDetailsEn assetDetails = TranslationsUserAssetAssetDetailsEn._(_root);
	late final TranslationsUserAssetAddAssetEn addAsset = TranslationsUserAssetAddAssetEn._(_root);
}

// Path: core.errors
class TranslationsCoreErrorsEn {
	TranslationsCoreErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get error => 'Hata';
	String get tryAgain => 'Tekrar dene';
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
	String lastUpdateTime({required Object time}) => 'Last update: ${time}';
}

// Path: currency.search
class TranslationsCurrencySearchEn {
	TranslationsCurrencySearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get hint => 'Search currency...';
}

// Path: currency.time
class TranslationsCurrencyTimeEn {
	TranslationsCurrencyTimeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String seconds({required Object count}) => '${count} seconds ago';
	String minutes({required Object count}) => '${count} minutes ago';
	String hours({required Object count}) => '${count} hours ago';
	String days({required Object count}) => '${count} days ago';
}

// Path: currency.names
class TranslationsCurrencyNamesEn {
	TranslationsCurrencyNamesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get KULCEALTIN => 'Bullion Gold';
	String get ALTIN => 'Gold';
	String get CEYREK_ESKI => 'Quarter Gold (Old)';
	String get CEYREK_YENI => 'Quarter Gold (New)';
	String get YARIM_ESKI => 'Half Gold (Old)';
	String get YARIM_YENI => 'Half Gold (New)';
	String get TEK_ESKI => 'Full Gold (Old)';
	String get TEK_YENI => 'Full Gold (New)';
	String get ATA_ESKI => 'Ata Gold (Old)';
	String get ATA_YENI => 'Ata Gold (New)';
	String get AUDTRY => 'Australian Dollar/TRY';
	String get AYAR22 => '22 Carat Gold';
	String get AYAR24 => '24 Carat Gold';
	String get AYAR26 => '26 Carat Gold';
	String get AYAR28 => '28 Carat Gold';
	String get AYAR30 => '30 Carat Gold';
	String get USDTRY => 'Dollar/TRY';
	String get EURTRY => 'Euro/TRY';
	String get GBPTRY => 'Sterling/TRY';
	String get CHFTRY => 'Franc/TRY';
	String get SARTRY => 'Riyal/TRY';
	String get JPYTRY => 'Yen/TRY';
	String get SEKTRY => 'Swedish Krona/TRY';
	String get DKKTRY => 'Danish Krona/TRY';
	String get NOKTRY => 'Norwegian Krona/TRY';
	String get CADTRY => 'Canadian Dollar/TRY';
	String get USDCAD => 'Dollar/Canadian Dollar';
	String get XAUXAG => 'Gold/Silver';
	String get USDPURE => 'Dollar';
	String get USDKG => 'Dollar/Kg';
	String get EURKG => 'Euro/Kg';
	String get GBPKG => 'Sterling/Kg';
	String get GBPUSD => 'Sterling/Dollar';
	String get GREMESE_ESKI => 'Gremese Gold (Old)';
	String get GREMESE_YENI => 'Gremese Gold (New)';
	String get ATA5_ESKI => 'Ata 5 (Old) Gold';
	String get ATA5_YENI => 'Ata 5 (New) Gold';
	String get GUMUSTRY => 'Silver/TRY';
	String get XPTUSD => 'Palladium/Dollar';
	String get EURUSD => 'Euro/Dollar';
	String get USDJPY => 'Dollar/Yen';
	String get XAGUSD => 'Silver/Dollar';
	String get GUMUSUSD => 'Silver/Dollar';
	String get XPDUSD => 'Platinum/Dollar';
	String get XAUUSD => 'Gold/Dollar';
	String get USDSAR => 'Dollar/Riyal';
	String get AUDUSD => 'Australian Dollar/Dollar';
	String get USDCHF => 'Dollar/Franc';
	String get USDCNY => 'Dollar/Chinese Yuan';
	String get USDMXN => 'Dollar/Mexican Peso';
	String get USDPHP => 'Dollar/Philippine Peso';
	String get USDMYR => 'Dollar/Malaysian Ringgit';
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

// Path: userAsset.portfolio
class TranslationsUserAssetPortfolioEn {
	TranslationsUserAssetPortfolioEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Assets';
	String get emptyMessage => 'No assets yet';
	String get addAssetHint => 'Click the + button to add a new asset';
	late final TranslationsUserAssetPortfolioTotalValueEn totalValue = TranslationsUserAssetPortfolioTotalValueEn._(_root);
	String get profitLoss => 'Profit/Loss';
}

// Path: userAsset.assetDetails
class TranslationsUserAssetAssetDetailsEn {
	TranslationsUserAssetAssetDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get amount => 'Amount';
	String get purchasePrice => 'Purchase Price';
	String get currentPrice => 'Current Price';
	String get purchaseDate => 'Purchase Date';
}

// Path: userAsset.addAsset
class TranslationsUserAssetAddAssetEn {
	TranslationsUserAssetAddAssetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Add Asset';
	late final TranslationsUserAssetAddAssetFieldsEn fields = TranslationsUserAssetAddAssetFieldsEn._(_root);
	late final TranslationsUserAssetAddAssetDatePickerEn datePicker = TranslationsUserAssetAddAssetDatePickerEn._(_root);
	String get errorMessage => 'Please fill all fields';
}

// Path: userAsset.portfolio.totalValue
class TranslationsUserAssetPortfolioTotalValueEn {
	TranslationsUserAssetPortfolioTotalValueEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Portfolio Value';
	String get currency => '₺';
}

// Path: userAsset.addAsset.fields
class TranslationsUserAssetAddAssetFieldsEn {
	TranslationsUserAssetAddAssetFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get type => 'Type';
	String get amount => 'Amount';
	String get price => 'Price';
	String get date => 'Date';
}

// Path: userAsset.addAsset.datePicker
class TranslationsUserAssetAddAssetDatePickerEn {
	TranslationsUserAssetAddAssetDatePickerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Select Date';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'core.appName': return 'AssetTracker';
			case 'core.errors.error': return 'Hata';
			case 'core.errors.tryAgain': return 'Tekrar dene';
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
			case 'currency.details.lastUpdateTime': return ({required Object time}) => 'Last update: ${time}';
			case 'currency.search.hint': return 'Search currency...';
			case 'currency.time.seconds': return ({required Object count}) => '${count} seconds ago';
			case 'currency.time.minutes': return ({required Object count}) => '${count} minutes ago';
			case 'currency.time.hours': return ({required Object count}) => '${count} hours ago';
			case 'currency.time.days': return ({required Object count}) => '${count} days ago';
			case 'currency.names.KULCEALTIN': return 'Bullion Gold';
			case 'currency.names.ALTIN': return 'Gold';
			case 'currency.names.CEYREK_ESKI': return 'Quarter Gold (Old)';
			case 'currency.names.CEYREK_YENI': return 'Quarter Gold (New)';
			case 'currency.names.YARIM_ESKI': return 'Half Gold (Old)';
			case 'currency.names.YARIM_YENI': return 'Half Gold (New)';
			case 'currency.names.TEK_ESKI': return 'Full Gold (Old)';
			case 'currency.names.TEK_YENI': return 'Full Gold (New)';
			case 'currency.names.ATA_ESKI': return 'Ata Gold (Old)';
			case 'currency.names.ATA_YENI': return 'Ata Gold (New)';
			case 'currency.names.AUDTRY': return 'Australian Dollar/TRY';
			case 'currency.names.AYAR22': return '22 Carat Gold';
			case 'currency.names.AYAR24': return '24 Carat Gold';
			case 'currency.names.AYAR26': return '26 Carat Gold';
			case 'currency.names.AYAR28': return '28 Carat Gold';
			case 'currency.names.AYAR30': return '30 Carat Gold';
			case 'currency.names.USDTRY': return 'Dollar/TRY';
			case 'currency.names.EURTRY': return 'Euro/TRY';
			case 'currency.names.GBPTRY': return 'Sterling/TRY';
			case 'currency.names.CHFTRY': return 'Franc/TRY';
			case 'currency.names.SARTRY': return 'Riyal/TRY';
			case 'currency.names.JPYTRY': return 'Yen/TRY';
			case 'currency.names.SEKTRY': return 'Swedish Krona/TRY';
			case 'currency.names.DKKTRY': return 'Danish Krona/TRY';
			case 'currency.names.NOKTRY': return 'Norwegian Krona/TRY';
			case 'currency.names.CADTRY': return 'Canadian Dollar/TRY';
			case 'currency.names.USDCAD': return 'Dollar/Canadian Dollar';
			case 'currency.names.XAUXAG': return 'Gold/Silver';
			case 'currency.names.USDPURE': return 'Dollar';
			case 'currency.names.USDKG': return 'Dollar/Kg';
			case 'currency.names.EURKG': return 'Euro/Kg';
			case 'currency.names.GBPKG': return 'Sterling/Kg';
			case 'currency.names.GBPUSD': return 'Sterling/Dollar';
			case 'currency.names.GREMESE_ESKI': return 'Gremese Gold (Old)';
			case 'currency.names.GREMESE_YENI': return 'Gremese Gold (New)';
			case 'currency.names.ATA5_ESKI': return 'Ata 5 (Old) Gold';
			case 'currency.names.ATA5_YENI': return 'Ata 5 (New) Gold';
			case 'currency.names.GUMUSTRY': return 'Silver/TRY';
			case 'currency.names.XPTUSD': return 'Palladium/Dollar';
			case 'currency.names.EURUSD': return 'Euro/Dollar';
			case 'currency.names.USDJPY': return 'Dollar/Yen';
			case 'currency.names.XAGUSD': return 'Silver/Dollar';
			case 'currency.names.GUMUSUSD': return 'Silver/Dollar';
			case 'currency.names.XPDUSD': return 'Platinum/Dollar';
			case 'currency.names.XAUUSD': return 'Gold/Dollar';
			case 'currency.names.USDSAR': return 'Dollar/Riyal';
			case 'currency.names.AUDUSD': return 'Australian Dollar/Dollar';
			case 'currency.names.USDCHF': return 'Dollar/Franc';
			case 'currency.names.USDCNY': return 'Dollar/Chinese Yuan';
			case 'currency.names.USDMXN': return 'Dollar/Mexican Peso';
			case 'currency.names.USDPHP': return 'Dollar/Philippine Peso';
			case 'currency.names.USDMYR': return 'Dollar/Malaysian Ringgit';
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
			case 'profile.title': return 'Profile';
			case 'userAsset.portfolio.title': return 'My Assets';
			case 'userAsset.portfolio.emptyMessage': return 'No assets yet';
			case 'userAsset.portfolio.addAssetHint': return 'Click the + button to add a new asset';
			case 'userAsset.portfolio.totalValue.label': return 'Portfolio Value';
			case 'userAsset.portfolio.totalValue.currency': return '₺';
			case 'userAsset.portfolio.profitLoss': return 'Profit/Loss';
			case 'userAsset.assetDetails.amount': return 'Amount';
			case 'userAsset.assetDetails.purchasePrice': return 'Purchase Price';
			case 'userAsset.assetDetails.currentPrice': return 'Current Price';
			case 'userAsset.assetDetails.purchaseDate': return 'Purchase Date';
			case 'userAsset.addAsset.title': return 'Add Asset';
			case 'userAsset.addAsset.fields.type': return 'Type';
			case 'userAsset.addAsset.fields.amount': return 'Amount';
			case 'userAsset.addAsset.fields.price': return 'Price';
			case 'userAsset.addAsset.fields.date': return 'Date';
			case 'userAsset.addAsset.datePicker.label': return 'Select Date';
			case 'userAsset.addAsset.errorMessage': return 'Please fill all fields';
			default: return null;
		}
	}
}

