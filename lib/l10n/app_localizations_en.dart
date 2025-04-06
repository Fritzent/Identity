// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Identity';

  @override
  String get welcomeToText => 'Welcome to ';

  @override
  String get identityMotto => ' - your personal cv management';

  @override
  String get getStarted => 'Get Started';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInSubTitle => 'Let’s connect to your account!';

  @override
  String get fullNameText => 'Full name';

  @override
  String get inputFullNameHintText => 'Input your full name';

  @override
  String get emailText => 'Email';

  @override
  String get inputEmailHintText => 'Input your active email';

  @override
  String get createPasswordText => 'Create password';

  @override
  String get createPasswordHintText => 'Input your secret password';

  @override
  String get confirmPasswordText => 'Confirm password';

  @override
  String get confirmPasswordHintText => 'Confirm your secret password';

  @override
  String get passwordText => 'Password';

  @override
  String get passwordHintText => 'Input your secret password';

  @override
  String get continueWithText => 'Or  Continue With';

  @override
  String get dontHaveAccount => 'Don’t have an account? ';

  @override
  String get signUp => 'Sign Up';

  @override
  String get google => 'Google';

  @override
  String get signUpSubTitle => 'First let’s create your account!';

  @override
  String textFieldErrorEmptyMessage(Object field) {
    return 'Column $field cannot be empty';
  }

  @override
  String get registerDataChooseTitle => 'What personal data you wish to share with us?';

  @override
  String get registerDataChooseSubTitile => 'Choose at least one to help us prepare you side';

  @override
  String get bioText => 'Bio';

  @override
  String get cvText => 'Curriculum Vitae';

  @override
  String get linkedIn => 'LinkedIn';

  @override
  String get instagram => 'Instagram';

  @override
  String get website => 'Website';

  @override
  String get project => 'Project';

  @override
  String get continueText => 'Continue';

  @override
  String get biographyText => 'Biography';

  @override
  String get biographySubTitle => 'Help us to know more about your self to prepare your biography side.';

  @override
  String get professionalTitle => 'Professional name';

  @override
  String get professionalFieldHint => 'Input your complete name';

  @override
  String get tellUsAboutTitle => 'Tell us about you';

  @override
  String get tellUsAboutFieldHint => 'Describe about yourself';

  @override
  String get dateOfBirthTitle => 'Date of birth';

  @override
  String get dateOfBirthFieldHint => 'Select your date birthday';

  @override
  String get currentLastJobTitle => 'Current / Last job position';

  @override
  String get currentLastJobFieldHint => 'Input your job position';

  @override
  String get lengthOfWorkExperienceTitle => 'Length of Work Experience';

  @override
  String get lengthOfWorkExperienceFieldHint => 'Input your experience in a year';

  @override
  String get closeText => 'Close';

  @override
  String get chooseText => 'Choose';

  @override
  String get cvSubTitle => 'Upload your latest CV to get more people interested in your background.';

  @override
  String get importYourFilesText => 'Import your files';

  @override
  String get personalLinkTitle => 'Personal Link';

  @override
  String get personalLinkSubtitle => 'Share your personal link on social media, websites, or projects to attract people\'s interest.';

  @override
  String get linkedinHintText => 'Share your LinkedIn profile';

  @override
  String get instagramHintText => 'Share your Instagram profile';

  @override
  String get websiteHintText => 'Share your personal website';

  @override
  String get projectHintText => 'Share your personal project';

  @override
  String get registrationSuccessText => 'Registration Success';

  @override
  String get registrationSuccessSubtitle => 'It\'s time to attract people with your amazing profile.';

  @override
  String get registrationFailed => 'Registration Failed';

  @override
  String get passwordWeakErrorMessage => 'Your password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.';

  @override
  String get passwordNotMatchErrorMessage => 'Passwords do not match. Please try again.';

  @override
  String get emailFormatNotCorrect => 'Your email address is not in the correct format.';

  @override
  String get iosGoogleSignUnSupported => 'Sorry, Google Sign In is not available at this time because we still need your financial support to activate the Apple Developer Account.';

  @override
  String get understoodText => 'Understood';

  @override
  String get unavailableText => 'Unavailable';
}
