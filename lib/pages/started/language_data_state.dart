part of 'language_data_bloc.dart';

class LanguageDataState {
  final Locale locale;

  LanguageDataState({
    this.locale = const Locale('en'),
  });

  LanguageDataState copyWith ({
    Locale? locale,
  }){
    return LanguageDataState(
      locale: locale ?? this.locale,
    );
  }
}
