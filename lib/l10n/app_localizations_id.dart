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

  @override
  String get signInSubTitle => 'Ayo hubungkan ke akun anda!';

  @override
  String get fullNameText => 'Nama lengkap';

  @override
  String get inputFullNameHintText => 'Silahkan ketik nama lengkap anda';

  @override
  String get emailText => 'Email';

  @override
  String get inputEmailHintText => 'Silahkan ketik email aktif anda';

  @override
  String get createPasswordText => 'Buat kata sandi';

  @override
  String get createPasswordHintText => 'Ketik kata sandi rahasia anda';

  @override
  String get confirmPasswordText => 'Konfirmasi kata sandi';

  @override
  String get confirmPasswordHintText => 'Konfirmasi kata sandi rahasia anda';

  @override
  String get passwordText => 'Kata sandi';

  @override
  String get passwordHintText => 'Ketik kata sandi rahasia anda';

  @override
  String get continueWithText => 'Atau lanjutkan dengan';

  @override
  String get dontHaveAccount => 'Belum punya akun? ';

  @override
  String get signUp => 'Daftar';

  @override
  String get google => 'Google';

  @override
  String get signUpSubTitle => 'Pertama mari kita buat akun Anda!';

  @override
  String textFieldErrorEmptyMessage(Object field) {
    return 'Kolom $field tidak boleh kosong';
  }
}
