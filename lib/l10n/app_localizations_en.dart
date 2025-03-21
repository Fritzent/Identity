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
  String get cvText => 'CV';

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
}
