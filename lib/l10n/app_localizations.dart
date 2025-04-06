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
  /// **'Curriculum Vitae'**
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

  /// No description provided for @biographyText.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get biographyText;

  /// No description provided for @biographySubTitle.
  ///
  /// In en, this message translates to:
  /// **'Help us to know more about your self to prepare your biography side.'**
  String get biographySubTitle;

  /// No description provided for @professionalTitle.
  ///
  /// In en, this message translates to:
  /// **'Professional name'**
  String get professionalTitle;

  /// No description provided for @professionalFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Input your complete name'**
  String get professionalFieldHint;

  /// No description provided for @tellUsAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us about you'**
  String get tellUsAboutTitle;

  /// No description provided for @tellUsAboutFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Describe about yourself'**
  String get tellUsAboutFieldHint;

  /// No description provided for @dateOfBirthTitle.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirthTitle;

  /// No description provided for @dateOfBirthFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Select your date birthday'**
  String get dateOfBirthFieldHint;

  /// No description provided for @currentLastJobTitle.
  ///
  /// In en, this message translates to:
  /// **'Current / Last job position'**
  String get currentLastJobTitle;

  /// No description provided for @currentLastJobFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Input your job position'**
  String get currentLastJobFieldHint;

  /// No description provided for @lengthOfWorkExperienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Length of Work Experience'**
  String get lengthOfWorkExperienceTitle;

  /// No description provided for @lengthOfWorkExperienceFieldHint.
  ///
  /// In en, this message translates to:
  /// **'Input your experience in a year'**
  String get lengthOfWorkExperienceFieldHint;

  /// No description provided for @closeText.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeText;

  /// No description provided for @chooseText.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get chooseText;

  /// No description provided for @cvSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload your latest CV to get more people interested in your background.'**
  String get cvSubTitle;

  /// No description provided for @importYourFilesText.
  ///
  /// In en, this message translates to:
  /// **'Import your files'**
  String get importYourFilesText;

  /// No description provided for @personalLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Link'**
  String get personalLinkTitle;

  /// No description provided for @personalLinkSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Share your personal link on social media, websites, or projects to attract people\'s interest.'**
  String get personalLinkSubtitle;

  /// No description provided for @linkedinHintText.
  ///
  /// In en, this message translates to:
  /// **'Share your LinkedIn profile'**
  String get linkedinHintText;

  /// No description provided for @instagramHintText.
  ///
  /// In en, this message translates to:
  /// **'Share your Instagram profile'**
  String get instagramHintText;

  /// No description provided for @websiteHintText.
  ///
  /// In en, this message translates to:
  /// **'Share your personal website'**
  String get websiteHintText;

  /// No description provided for @projectHintText.
  ///
  /// In en, this message translates to:
  /// **'Share your personal project'**
  String get projectHintText;

  /// No description provided for @registrationSuccessText.
  ///
  /// In en, this message translates to:
  /// **'Registration Success'**
  String get registrationSuccessText;

  /// No description provided for @registrationSuccessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'It\'s time to attract people with your amazing profile.'**
  String get registrationSuccessSubtitle;

  /// No description provided for @registrationFailed.
  ///
  /// In en, this message translates to:
  /// **'Registration Failed'**
  String get registrationFailed;

  /// No description provided for @passwordWeakErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Your password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.'**
  String get passwordWeakErrorMessage;

  /// No description provided for @passwordNotMatchErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match. Please try again.'**
  String get passwordNotMatchErrorMessage;

  /// No description provided for @emailFormatNotCorrect.
  ///
  /// In en, this message translates to:
  /// **'Your email address is not in the correct format.'**
  String get emailFormatNotCorrect;

  /// No description provided for @iosGoogleSignUnSupported.
  ///
  /// In en, this message translates to:
  /// **'Sorry, Google Sign In is not available at this time because we still need your financial support to activate the Apple Developer Account.'**
  String get iosGoogleSignUnSupported;

  /// No description provided for @understoodText.
  ///
  /// In en, this message translates to:
  /// **'Understood'**
  String get understoodText;

  /// No description provided for @unavailableText.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailableText;
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
