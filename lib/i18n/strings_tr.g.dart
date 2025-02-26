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
	@override late final _TranslationsSocketTr socket = _TranslationsSocketTr._(_root);
	@override late final _TranslationsCurrencyTr currency = _TranslationsCurrencyTr._(_root);
	@override late final _TranslationsRegistrationTr registration = _TranslationsRegistrationTr._(_root);
	@override late final _TranslationsHomeTr home = _TranslationsHomeTr._(_root);
	@override late final _TranslationsProfileTr profile = _TranslationsProfileTr._(_root);
	@override late final _TranslationsUserAssetTr userAsset = _TranslationsUserAssetTr._(_root);
}

// Path: core
class _TranslationsCoreTr implements TranslationsCoreEn {
	_TranslationsCoreTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get appName => 'AssetTracker';
	@override late final _TranslationsCoreErrorsTr errors = _TranslationsCoreErrorsTr._(_root);
}

// Path: socket
class _TranslationsSocketTr implements TranslationsSocketEn {
	_TranslationsSocketTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSocketStatusTr status = _TranslationsSocketStatusTr._(_root);
	@override late final _TranslationsSocketLogsTr logs = _TranslationsSocketLogsTr._(_root);
}

// Path: currency
class _TranslationsCurrencyTr implements TranslationsCurrencyEn {
	_TranslationsCurrencyTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCurrencyDetailsTr details = _TranslationsCurrencyDetailsTr._(_root);
	@override late final _TranslationsCurrencySearchTr search = _TranslationsCurrencySearchTr._(_root);
	@override late final _TranslationsCurrencyTimeTr time = _TranslationsCurrencyTimeTr._(_root);
	@override late final _TranslationsCurrencyNamesTr names = _TranslationsCurrencyNamesTr._(_root);
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
	@override late final _TranslationsRegistrationSignOutTr signOut = _TranslationsRegistrationSignOutTr._(_root);
}

// Path: home
class _TranslationsHomeTr implements TranslationsHomeEn {
	_TranslationsHomeTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Varlıklar';
	@override String get initializing => 'Başlatılıyor...';
	@override String get disconnected => 'Bağlantı Koptu';
	@override String get connected => 'Bağlantı Kuruldu';
}

// Path: profile
class _TranslationsProfileTr implements TranslationsProfileEn {
	_TranslationsProfileTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
}

// Path: userAsset
class _TranslationsUserAssetTr implements TranslationsUserAssetEn {
	_TranslationsUserAssetTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsUserAssetPortfolioTr portfolio = _TranslationsUserAssetPortfolioTr._(_root);
	@override late final _TranslationsUserAssetAssetDetailsTr assetDetails = _TranslationsUserAssetAssetDetailsTr._(_root);
	@override late final _TranslationsUserAssetAddAssetTr addAsset = _TranslationsUserAssetAddAssetTr._(_root);
}

// Path: core.errors
class _TranslationsCoreErrorsTr implements TranslationsCoreErrorsEn {
	_TranslationsCoreErrorsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get error => 'Hata';
	@override String get tryAgain => 'Tekrar dene';
	@override String get accountExists => 'Bu e-posta adresi zaten kullanımda';
	@override String get invalidCredentials => 'Geçersiz e-posta veya şifre';
	@override String get notFound => 'Kullanıcı bulunamadı';
	@override String get invalidEmail => 'Geçersiz e-posta adresi';
	@override String get wrongPassword => 'Geçersiz şifre';
	@override String get userDisabled => 'Kullanıcı devre dışı bırakıldı';
	@override String get timeout => 'İstek zaman aşımına uğradı. Lütfen tekrar deneyin';
	@override String get unknown => 'Bilinmeyen bir hata oluştu';
	@override String get requestQuota => 'Çok fazla giriş denemesi yapıldı. Lütfen daha sonra tekrar deneyin';
	@override String socketConnection({required Object error, required Object current, required Object max}) => 'Bağlantı hatası: ${error}\nYeniden deneme ${current}/${max}';
	@override String get maxRetryReached => 'Maksimum bağlantı deneme sayısına ulaşıldı. Lütfen daha sonra tekrar deneyin';
	@override String get socketDisconnected => 'Bağlantı kesildi. Son alınan veriler gösteriliyor...';
}

// Path: socket.status
class _TranslationsSocketStatusTr implements TranslationsSocketStatusEn {
	_TranslationsSocketStatusTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get connecting => 'Bağlanıyor...';
	@override String get connected => 'Bağlandı';
	@override String get disconnected => 'Bağlantı Kesildi';
	@override String error({required Object message}) => 'Hata: ${message}';
}

// Path: socket.logs
class _TranslationsSocketLogsTr implements TranslationsSocketLogsEn {
	_TranslationsSocketLogsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get handshakeReceived => 'El sıkışma alındı, abone mesajı gönderiliyor';
	@override String get initialDataReceived => 'İlk veri alındı';
	@override String get dataUpdated => 'Veri güncellendi';
	@override String get connectionClosed => 'Soket bağlantısı kapandı';
	@override String get tryingResubscribe => 'Yeniden abone olmaya çalışılıyor...';
	@override String get connectionLost => 'Bağlantı koptu, yeniden bağlanmaya çalışılıyor...';
	@override String get cannotSendMessage => 'Mesaj gönderilemedi: soket bağlı değil';
	@override String jsonParseError({required Object error}) => 'JSON verisi ayrıştırma hatası: ${error}';
	@override String oldCurrencyLog({required Object currency}) => 'Eski Para Birimi: ${currency}';
	@override String receivedData({required Object data}) => 'Alınan veri: ${data}';
}

// Path: currency.details
class _TranslationsCurrencyDetailsTr implements TranslationsCurrencyDetailsEn {
	_TranslationsCurrencyDetailsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get buy => 'Alış';
	@override String get sell => 'Satış';
	@override String get lowest => 'En Düşük';
	@override String get highest => 'En Yüksek';
	@override String get closing => 'Kapanış';
	@override String get lastUpdate => 'Son Güncelleme';
	@override String lastUpdateTime({required Object time}) => 'Son güncelleme: ${time}';
}

// Path: currency.search
class _TranslationsCurrencySearchTr implements TranslationsCurrencySearchEn {
	_TranslationsCurrencySearchTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get hint => 'Para birimi ara...';
}

// Path: currency.time
class _TranslationsCurrencyTimeTr implements TranslationsCurrencyTimeEn {
	_TranslationsCurrencyTimeTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String seconds({required Object count}) => '${count} saniye önce';
	@override String minutes({required Object count}) => '${count} dakika önce';
	@override String hours({required Object count}) => '${count} saat önce';
	@override String days({required Object count}) => '${count} gün önce';
}

// Path: currency.names
class _TranslationsCurrencyNamesTr implements TranslationsCurrencyNamesEn {
	_TranslationsCurrencyNamesTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get KULCEALTIN => 'Külçe Altın';
	@override String get ALTIN => 'Altın';
	@override String get CEYREK_ESKI => 'Çeyrek Altın (Eski)';
	@override String get CEYREK_YENI => 'Çeyrek Altın (Yeni)';
	@override String get YARIM_ESKI => 'Yarım Altın (Eski)';
	@override String get YARIM_YENI => 'Yarım Altın (Yeni)';
	@override String get TEK_ESKI => 'Tek Altın (Eski)';
	@override String get TEK_YENI => 'Tek Altın (Yeni)';
	@override String get ATA_ESKI => 'Ata Altın (Eski)';
	@override String get ATA_YENI => 'Ata Altın (Yeni)';
	@override String get AUDTRY => 'Avustralya Doları/TRY';
	@override String get AYAR22 => '22 Ayar Altın';
	@override String get AYAR24 => '24 Ayar Altın';
	@override String get AYAR26 => '26 Ayar Altın';
	@override String get AYAR28 => '28 Ayar Altın';
	@override String get AYAR30 => '30 Ayar Altın';
	@override String get USDTRY => 'Dolar/TRY';
	@override String get EURTRY => 'Euro/TRY';
	@override String get GBPTRY => 'Sterlin/TRY';
	@override String get CHFTRY => 'Frang/TRY';
	@override String get SARTRY => 'Riyal/TRY';
	@override String get JPYTRY => 'Yen/TRY';
	@override String get SEKTRY => 'İsveç Kronu/TRY';
	@override String get DKKTRY => 'Danimarka Kronu/TRY';
	@override String get NOKTRY => 'Norveç Kronu/TRY';
	@override String get CADTRY => 'Kanada Doları/TRY';
	@override String get USDCAD => 'Dolar/Kanada Doları';
	@override String get XAUXAG => 'Altın/Gümüş';
	@override String get USDPURE => 'Dolar';
	@override String get USDKG => 'Dolar/Kg';
	@override String get EURKG => 'Euro/Kg';
	@override String get GBPKG => 'Sterlin/Kg';
	@override String get GBPUSD => 'Sterlin/Dolar';
	@override String get GREMESE_ESKI => 'Gremese Altın (Eski)';
	@override String get GREMESE_YENI => 'Gremese Altın (Yeni)';
	@override String get ATA5_ESKI => 'Ata 5 (Eski) Altın';
	@override String get ATA5_YENI => 'Ata 5 (Yeni) Altın';
	@override String get GUMUSTRY => 'Gümüş/TRY';
	@override String get XPTUSD => 'Palladyum/Dolar';
	@override String get EURUSD => 'Euro/Dolar';
	@override String get USDJPY => 'Dolar/Yen';
	@override String get XAGUSD => 'Gümüş/Dolar';
	@override String get GUMUSUSD => 'Gümüş/Dolar';
	@override String get XPDUSD => 'Platin/Dolar';
	@override String get XAUUSD => 'Altın/Dolar';
	@override String get USDSAR => 'Dolar/Riyal';
	@override String get AUDUSD => 'Avustralya Doları/Dolar';
	@override String get USDCHF => 'Dolar/Frang';
	@override String get USDCNY => 'Dolar/Çin Yuanı';
	@override String get USDMXN => 'Dolar/Meksika Pesosu';
	@override String get USDPHP => 'Dolar/Filipin Pesosu';
	@override String get USDMYR => 'Dolar/Malezya Ringgiti';
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

// Path: registration.signOut
class _TranslationsRegistrationSignOutTr implements TranslationsRegistrationSignOutEn {
	_TranslationsRegistrationSignOutTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get signOutText => 'Çıkış Yap';
}

// Path: userAsset.portfolio
class _TranslationsUserAssetPortfolioTr implements TranslationsUserAssetPortfolioEn {
	_TranslationsUserAssetPortfolioTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Varlıklarım';
	@override String get emptyMessage => 'Henüz varlık bulunmuyor';
	@override String get addAssetHint => 'Yeni varlık eklemek için + butonuna tıklayın';
	@override late final _TranslationsUserAssetPortfolioTotalValueTr totalValue = _TranslationsUserAssetPortfolioTotalValueTr._(_root);
	@override String get profitLoss => 'Kâr/Zarar';
}

// Path: userAsset.assetDetails
class _TranslationsUserAssetAssetDetailsTr implements TranslationsUserAssetAssetDetailsEn {
	_TranslationsUserAssetAssetDetailsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get amount => 'Miktar';
	@override String get purchasePrice => 'Alış';
	@override String get currentPrice => 'Güncel';
	@override String get purchaseDate => 'Alış Tarihi';
}

// Path: userAsset.addAsset
class _TranslationsUserAssetAddAssetTr implements TranslationsUserAssetAddAssetEn {
	_TranslationsUserAssetAddAssetTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Varlık Ekle';
	@override late final _TranslationsUserAssetAddAssetFieldsTr fields = _TranslationsUserAssetAddAssetFieldsTr._(_root);
	@override late final _TranslationsUserAssetAddAssetDatePickerTr datePicker = _TranslationsUserAssetAddAssetDatePickerTr._(_root);
	@override String get errorMessage => 'Lütfen tüm alanları doldurun';
}

// Path: userAsset.portfolio.totalValue
class _TranslationsUserAssetPortfolioTotalValueTr implements TranslationsUserAssetPortfolioTotalValueEn {
	_TranslationsUserAssetPortfolioTotalValueTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Portföy Değeri';
	@override String get currency => '₺';
}

// Path: userAsset.addAsset.fields
class _TranslationsUserAssetAddAssetFieldsTr implements TranslationsUserAssetAddAssetFieldsEn {
	_TranslationsUserAssetAddAssetFieldsTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get type => 'Tür';
	@override String get amount => 'Miktar';
	@override String get price => 'Fiyat';
	@override String get date => 'Tarih';
}

// Path: userAsset.addAsset.datePicker
class _TranslationsUserAssetAddAssetDatePickerTr implements TranslationsUserAssetAddAssetDatePickerEn {
	_TranslationsUserAssetAddAssetDatePickerTr._(this._root);

	final TranslationsTr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Tarih Seç';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'core.appName': return 'AssetTracker';
			case 'core.errors.error': return 'Hata';
			case 'core.errors.tryAgain': return 'Tekrar dene';
			case 'core.errors.accountExists': return 'Bu e-posta adresi zaten kullanımda';
			case 'core.errors.invalidCredentials': return 'Geçersiz e-posta veya şifre';
			case 'core.errors.notFound': return 'Kullanıcı bulunamadı';
			case 'core.errors.invalidEmail': return 'Geçersiz e-posta adresi';
			case 'core.errors.wrongPassword': return 'Geçersiz şifre';
			case 'core.errors.userDisabled': return 'Kullanıcı devre dışı bırakıldı';
			case 'core.errors.timeout': return 'İstek zaman aşımına uğradı. Lütfen tekrar deneyin';
			case 'core.errors.unknown': return 'Bilinmeyen bir hata oluştu';
			case 'core.errors.requestQuota': return 'Çok fazla giriş denemesi yapıldı. Lütfen daha sonra tekrar deneyin';
			case 'core.errors.socketConnection': return ({required Object error, required Object current, required Object max}) => 'Bağlantı hatası: ${error}\nYeniden deneme ${current}/${max}';
			case 'core.errors.maxRetryReached': return 'Maksimum bağlantı deneme sayısına ulaşıldı. Lütfen daha sonra tekrar deneyin';
			case 'core.errors.socketDisconnected': return 'Bağlantı kesildi. Son alınan veriler gösteriliyor...';
			case 'socket.status.connecting': return 'Bağlanıyor...';
			case 'socket.status.connected': return 'Bağlandı';
			case 'socket.status.disconnected': return 'Bağlantı Kesildi';
			case 'socket.status.error': return ({required Object message}) => 'Hata: ${message}';
			case 'socket.logs.handshakeReceived': return 'El sıkışma alındı, abone mesajı gönderiliyor';
			case 'socket.logs.initialDataReceived': return 'İlk veri alındı';
			case 'socket.logs.dataUpdated': return 'Veri güncellendi';
			case 'socket.logs.connectionClosed': return 'Soket bağlantısı kapandı';
			case 'socket.logs.tryingResubscribe': return 'Yeniden abone olmaya çalışılıyor...';
			case 'socket.logs.connectionLost': return 'Bağlantı koptu, yeniden bağlanmaya çalışılıyor...';
			case 'socket.logs.cannotSendMessage': return 'Mesaj gönderilemedi: soket bağlı değil';
			case 'socket.logs.jsonParseError': return ({required Object error}) => 'JSON verisi ayrıştırma hatası: ${error}';
			case 'socket.logs.oldCurrencyLog': return ({required Object currency}) => 'Eski Para Birimi: ${currency}';
			case 'socket.logs.receivedData': return ({required Object data}) => 'Alınan veri: ${data}';
			case 'currency.details.buy': return 'Alış';
			case 'currency.details.sell': return 'Satış';
			case 'currency.details.lowest': return 'En Düşük';
			case 'currency.details.highest': return 'En Yüksek';
			case 'currency.details.closing': return 'Kapanış';
			case 'currency.details.lastUpdate': return 'Son Güncelleme';
			case 'currency.details.lastUpdateTime': return ({required Object time}) => 'Son güncelleme: ${time}';
			case 'currency.search.hint': return 'Para birimi ara...';
			case 'currency.time.seconds': return ({required Object count}) => '${count} saniye önce';
			case 'currency.time.minutes': return ({required Object count}) => '${count} dakika önce';
			case 'currency.time.hours': return ({required Object count}) => '${count} saat önce';
			case 'currency.time.days': return ({required Object count}) => '${count} gün önce';
			case 'currency.names.KULCEALTIN': return 'Külçe Altın';
			case 'currency.names.ALTIN': return 'Altın';
			case 'currency.names.CEYREK_ESKI': return 'Çeyrek Altın (Eski)';
			case 'currency.names.CEYREK_YENI': return 'Çeyrek Altın (Yeni)';
			case 'currency.names.YARIM_ESKI': return 'Yarım Altın (Eski)';
			case 'currency.names.YARIM_YENI': return 'Yarım Altın (Yeni)';
			case 'currency.names.TEK_ESKI': return 'Tek Altın (Eski)';
			case 'currency.names.TEK_YENI': return 'Tek Altın (Yeni)';
			case 'currency.names.ATA_ESKI': return 'Ata Altın (Eski)';
			case 'currency.names.ATA_YENI': return 'Ata Altın (Yeni)';
			case 'currency.names.AUDTRY': return 'Avustralya Doları/TRY';
			case 'currency.names.AYAR22': return '22 Ayar Altın';
			case 'currency.names.AYAR24': return '24 Ayar Altın';
			case 'currency.names.AYAR26': return '26 Ayar Altın';
			case 'currency.names.AYAR28': return '28 Ayar Altın';
			case 'currency.names.AYAR30': return '30 Ayar Altın';
			case 'currency.names.USDTRY': return 'Dolar/TRY';
			case 'currency.names.EURTRY': return 'Euro/TRY';
			case 'currency.names.GBPTRY': return 'Sterlin/TRY';
			case 'currency.names.CHFTRY': return 'Frang/TRY';
			case 'currency.names.SARTRY': return 'Riyal/TRY';
			case 'currency.names.JPYTRY': return 'Yen/TRY';
			case 'currency.names.SEKTRY': return 'İsveç Kronu/TRY';
			case 'currency.names.DKKTRY': return 'Danimarka Kronu/TRY';
			case 'currency.names.NOKTRY': return 'Norveç Kronu/TRY';
			case 'currency.names.CADTRY': return 'Kanada Doları/TRY';
			case 'currency.names.USDCAD': return 'Dolar/Kanada Doları';
			case 'currency.names.XAUXAG': return 'Altın/Gümüş';
			case 'currency.names.USDPURE': return 'Dolar';
			case 'currency.names.USDKG': return 'Dolar/Kg';
			case 'currency.names.EURKG': return 'Euro/Kg';
			case 'currency.names.GBPKG': return 'Sterlin/Kg';
			case 'currency.names.GBPUSD': return 'Sterlin/Dolar';
			case 'currency.names.GREMESE_ESKI': return 'Gremese Altın (Eski)';
			case 'currency.names.GREMESE_YENI': return 'Gremese Altın (Yeni)';
			case 'currency.names.ATA5_ESKI': return 'Ata 5 (Eski) Altın';
			case 'currency.names.ATA5_YENI': return 'Ata 5 (Yeni) Altın';
			case 'currency.names.GUMUSTRY': return 'Gümüş/TRY';
			case 'currency.names.XPTUSD': return 'Palladyum/Dolar';
			case 'currency.names.EURUSD': return 'Euro/Dolar';
			case 'currency.names.USDJPY': return 'Dolar/Yen';
			case 'currency.names.XAGUSD': return 'Gümüş/Dolar';
			case 'currency.names.GUMUSUSD': return 'Gümüş/Dolar';
			case 'currency.names.XPDUSD': return 'Platin/Dolar';
			case 'currency.names.XAUUSD': return 'Altın/Dolar';
			case 'currency.names.USDSAR': return 'Dolar/Riyal';
			case 'currency.names.AUDUSD': return 'Avustralya Doları/Dolar';
			case 'currency.names.USDCHF': return 'Dolar/Frang';
			case 'currency.names.USDCNY': return 'Dolar/Çin Yuanı';
			case 'currency.names.USDMXN': return 'Dolar/Meksika Pesosu';
			case 'currency.names.USDPHP': return 'Dolar/Filipin Pesosu';
			case 'currency.names.USDMYR': return 'Dolar/Malezya Ringgiti';
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
			case 'registration.signOut.signOutText': return 'Çıkış Yap';
			case 'home.title': return 'Varlıklar';
			case 'home.initializing': return 'Başlatılıyor...';
			case 'home.disconnected': return 'Bağlantı Koptu';
			case 'home.connected': return 'Bağlantı Kuruldu';
			case 'profile.title': return 'Profil';
			case 'userAsset.portfolio.title': return 'Varlıklarım';
			case 'userAsset.portfolio.emptyMessage': return 'Henüz varlık bulunmuyor';
			case 'userAsset.portfolio.addAssetHint': return 'Yeni varlık eklemek için + butonuna tıklayın';
			case 'userAsset.portfolio.totalValue.label': return 'Portföy Değeri';
			case 'userAsset.portfolio.totalValue.currency': return '₺';
			case 'userAsset.portfolio.profitLoss': return 'Kâr/Zarar';
			case 'userAsset.assetDetails.amount': return 'Miktar';
			case 'userAsset.assetDetails.purchasePrice': return 'Alış';
			case 'userAsset.assetDetails.currentPrice': return 'Güncel';
			case 'userAsset.assetDetails.purchaseDate': return 'Alış Tarihi';
			case 'userAsset.addAsset.title': return 'Varlık Ekle';
			case 'userAsset.addAsset.fields.type': return 'Tür';
			case 'userAsset.addAsset.fields.amount': return 'Miktar';
			case 'userAsset.addAsset.fields.price': return 'Fiyat';
			case 'userAsset.addAsset.fields.date': return 'Tarih';
			case 'userAsset.addAsset.datePicker.label': return 'Tarih Seç';
			case 'userAsset.addAsset.errorMessage': return 'Lütfen tüm alanları doldurun';
			default: return null;
		}
	}
}

