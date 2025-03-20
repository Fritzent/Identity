import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';

part 'custome_text_field_event.dart';
part 'custome_text_field_state.dart';

class CustomeTextFieldBloc extends Bloc<CustomeTextFieldEvent, CustomeTextFieldState> {
  CustomeTextFieldBloc() : super(CustomeTextFieldState()) {
    on<OnFocusChange>(onFocusChange);
    on<OnTextChange>(onTextChange);
    on<OnUpdateField>(onUpdateField);
    on<OnChangeObscureText> (onChangeObscureText);
  }

  FutureOr<void> onFocusChange(
      OnFocusChange event, Emitter<CustomeTextFieldState> emit) {
    if (state.countInit > 0) {
      emit(state.copyWith(countInit: 0));
    }
    emit(state.copyWith(isFocused: event.isFocused));
  }

  FutureOr<void> onTextChange(
      OnTextChange event, Emitter<CustomeTextFieldState> emit) {
    String error = '';

    if (event.value.isEmpty && state.countInit >= 1) {
      error = AppLocalizations.of(state.context!)!.textFieldErrorEmptyMessage(state.formSection);
    }

    int sumCountInit = state.countInit + 1;
    
    emit(state.copyWith(
        isEmpty: event.isEmpty,
        fieldValue: event.value,
        errorMessage: error,
        context: event.context,
        formSection: event.formSection,
        countInit: sumCountInit));
  }

  FutureOr<void> onUpdateField(
      OnUpdateField event, Emitter<CustomeTextFieldState> emit) {
    final newController = TextEditingController(text: event.value);
    emit(state.copyWith(controller: newController));
  }

  FutureOr<void> onChangeObscureText(OnChangeObscureText event, Emitter<CustomeTextFieldState> emit) {
    emit(state.copyWith(obscureText: event.obscureText));
  }
}
