part of 'language_data_bloc.dart';

@immutable
sealed class LanguageDataEvent {}

class LoadLanguage extends LanguageDataEvent {}

class ChangeLanguage extends LanguageDataEvent {
  final Locale newLocale;
  ChangeLanguage(this.newLocale);
}
