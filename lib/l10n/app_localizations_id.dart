// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Identity';

  @override
  String get welcomeToText => 'Selamat datang di ';

  @override
  String get identityMotto => ' - management cv pribadi anda';

  @override
  String get getStarted => 'Mulai';

  @override
  String get alreadyHaveAccount => 'Sudah punya akun? ';

  @override
  String get signIn => 'Masuk';
}
