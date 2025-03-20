import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_data_event.dart';
part 'language_data_state.dart';

class LanguageDataBloc extends Bloc<LanguageDataEvent, LanguageDataState> {
  LanguageDataBloc() : super(LanguageDataState()) {
    on<ChangeLanguage>(onChangeLanguage);
  }

  FutureOr<void> onChangeLanguage(ChangeLanguage event, Emitter<LanguageDataState> emit) {
    emit(state.copyWith(locale: event.newLocale));
  }
}
