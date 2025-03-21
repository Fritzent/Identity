import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get appName;

  /// No description provided for @welcomeToText.
  ///
  /// In en, this message translates to:
  /// **'Welcome to '**
  String get welcomeToText;

  /// No description provided for @identityMotto.
  ///
  /// In en, this message translates to:
  /// **' - your personal cv management'**
  String get identityMotto;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Let’s connect to your account!'**
  String get signInSubTitle;

  /// No description provided for @fullNameText.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullNameText;

  /// No description provided for @inputFullNameHintText.
  ///
  /// In en, this message translates to:
  /// **'Input your full name'**
  String get inputFullNameHintText;

  /// No description provided for @emailText.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailText;

  /// No description provided for @inputEmailHintText.
  ///
  /// In en, this message translates to:
  /// **'Input your active email'**
  String get inputEmailHintText;

  /// No description provided for @createPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Create password'**
  String get createPasswordText;

  /// No description provided for @createPasswordHintText.
  ///
  /// In en, this message translates to:
  /// **'Input your secret password'**
  String get createPasswordHintText;

  /// No description provided for @confirmPasswordText.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPasswordText;

  /// No description provided for @confirmPasswordHintText.
  ///
  /// In en, this message translates to:
  /// **'Confirm your secret password'**
  String get confirmPasswordHintText;

  /// No description provided for @passwordText.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordText;

  /// No description provided for @passwordHintText.
  ///
  /// In en, this message translates to:
  /// **'Input your secret password'**
  String get passwordHintText;

  /// No description provided for @continueWithText.
  ///
  /// In en, this message translates to:
  /// **'Or  Continue With'**
  String get continueWithText;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @signUpSubTitle.
  ///
  /// In en, this message translates to:
  /// **'First let’s create your account!'**
  String get signUpSubTitle;

  /// No description provided for @textFieldErrorEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Column {field} cannot be empty'**
  String textFieldErrorEmptyMessage(Object field);

  /// No description provided for @registerDataChooseTitle.
  ///
  /// In en, this message translates to:
  /// **'What personal data you wish to share with us?'**
  String get registerDataChooseTitle;

  /// No description provided for @registerDataChooseSubTitile.
  ///
  /// In en, this message translates to:
  /// **'Choose at least one to help us prepare you side'**
  String get registerDataChooseSubTitile;

  /// No description provided for @bioText.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bioText;

  /// No description provided for @cvText.
  ///
  /// In en, this message translates to:
  /// **'CV'**
  String get cvText;

  /// No description provided for @linkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedIn;

  /// No description provided for @instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @project.
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get project;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'id': return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
