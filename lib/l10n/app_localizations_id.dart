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

  @override
  String get registerDataChooseTitle => 'Data pribadi apa yang ingin anda bagikan kepada kami?';

  @override
  String get registerDataChooseSubTitile => 'Pilih setidaknya satu untuk membantu kami mempersiapkan sisi anda';

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
  String get continueText => 'Selanjutnya';

  @override
  String get biographyText => 'Biografi';

  @override
  String get biographySubTitle => 'Bantu kami untuk mengetahui lebih banyak tentang diri Anda.';

  @override
  String get professionalTitle => 'Nama profesional';

  @override
  String get professionalFieldHint => 'Masukkan nama lengkap Anda';

  @override
  String get tellUsAboutTitle => 'Beritahu kami tentang Anda';

  @override
  String get tellUsAboutFieldHint => 'Jelaskan tentang diri Anda';

  @override
  String get dateOfBirthTitle => 'Tanggal lahir';

  @override
  String get dateOfBirthFieldHint => 'Pilih tanggal ulang tahun Anda';

  @override
  String get currentLastJobTitle => 'Posisi pekerjaan saat ini / terakhir';

  @override
  String get currentLastJobFieldHint => 'Masukkan posisi pekerjaan Anda';

  @override
  String get lengthOfWorkExperienceTitle => 'Lama Pengalaman Kerja';

  @override
  String get lengthOfWorkExperienceFieldHint => 'Masukkan pengalaman Anda dalam satu tahun';

  @override
  String get closeText => 'Tutup';

  @override
  String get chooseText => 'Pilih';
}
