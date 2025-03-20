import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:identity/l10n/l10n.dart';

part 'language_data_event.dart';
part 'language_data_state.dart';

class LanguageDataBloc extends Bloc<LanguageDataEvent, LanguageDataState> {
  static const String localeKey =
      'selectedLocale';
  final Box settingsBox = Hive.box('languageBox');

  LanguageDataBloc() : super(LanguageDataState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<LoadLanguage>(onLoadLanguage);
  }

  FutureOr<void> onLoadLanguage(
      LoadLanguage event, Emitter<LanguageDataState> emit) {
    String savedLocale = settingsBox.get(localeKey, defaultValue: L10n.all.first.languageCode);
    emit(state.copyWith(locale: Locale(savedLocale)));
  }

  FutureOr<void> onChangeLanguage(
      ChangeLanguage event, Emitter<LanguageDataState> emit) async {
    await settingsBox.put(localeKey, event.newLocale.languageCode);
    emit(state.copyWith(locale: event.newLocale));
  }
}
