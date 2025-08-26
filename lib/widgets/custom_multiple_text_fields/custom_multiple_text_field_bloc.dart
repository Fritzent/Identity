import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';

part 'custom_multiple_text_field_event.dart';
part 'custom_multiple_text_field_state.dart';

class CustomMultipleTextFieldBloc
    extends Bloc<CustomMultipleTextFieldEvent, CustomMultipleTextFieldState> {
  CustomMultipleTextFieldBloc() : super(CustomMultipleTextFieldState()) {
    on<OnInit>(onInit);
    on<OnFocusChangeMultiple>(onFocusChangeMultiple);
    on<OnTextChangeMultiple>(onTextChangeMultiple);
    on<OnUpdateFieldMultiple>(onUpdateFieldMultiple);
    on<OnChangeObscureTextMultiple>(onChangeObscureTextMultiple);
  }

  FutureOr<void> onInit(
      OnInit event, Emitter<CustomMultipleTextFieldState> emit) {
    if (state.focusNodeList != null &&
        state.focusNodeList!.length < event.numberOfGeneratedFields) {
      List<FocusNode> focusNodes = List.from(state.focusNodeList ?? []);

      for (int i = 0; i < event.numberOfGeneratedFields; i++) {
        focusNodes.add(FocusNode());
      }

      emit(state.copyWith(focusNodeList: focusNodes));
    }

    if (state.controllerList != null &&
        state.controllerList!.length < event.numberOfGeneratedFields) {
      List<TextEditingController> controllers =
          List.from(state.controllerList ?? []);

      for (int i = 0; i < event.numberOfGeneratedFields; i++) {
        controllers.add(TextEditingController());
      }

      emit(state.copyWith(controllerList: controllers));
    }
  }

  FutureOr<void> onFocusChangeMultiple(
      OnFocusChangeMultiple event, Emitter<CustomMultipleTextFieldState> emit) {
    List<bool> updatedIsFocusedList = List.from(state.isFocusedList);
    if (event.index >= 0 && event.index < updatedIsFocusedList.length) {
      updatedIsFocusedList[event.index] = event.isFocused;
      emit(state.copyWith(isFocusedList: updatedIsFocusedList));
    }
  }

  FutureOr<void> onTextChangeMultiple(
      OnTextChangeMultiple event, Emitter<CustomMultipleTextFieldState> emit) {
    List<String> updatedErrorMessageList = List.from(state.errorMessageList);
    List<bool> updatedIsEmptyList = List.from(state.isEmptyList);
    List<String> updatedFieldValueList = List.from(state.fieldValueList);
    List<int> updatedCountInitList = List.from(state.countInitList);
    String error = '';

    if (event.value.isEmpty &&
        (event.index < updatedCountInitList.length &&
            updatedCountInitList[event.index] >= 1)) {
      error = AppLocalizations.of(state.context!)!
          .textFieldErrorEmptyMessage(event.formSection);
    }

    if (event.index >= 0 && event.index < updatedErrorMessageList.length) {
      updatedErrorMessageList[event.index] = error;
      updatedIsEmptyList[event.index] = event.isEmpty;
      updatedFieldValueList[event.index] = event.value;
      updatedCountInitList[event.index] =
          (updatedCountInitList[event.index]) + 1;

      emit(state.copyWith(
        errorMessageList: updatedErrorMessageList,
        isEmptyList: updatedIsEmptyList,
        fieldValueList: updatedFieldValueList,
        countInitList: updatedCountInitList,
        context: event.context,
        formSectionList: List.from(state.formSectionList)
          ..asMap().forEach((i, section) {
            if (i == event.index) {
              section = event.formSection;
            }
          }),
      ));
    }
  }

  FutureOr<void> onUpdateFieldMultiple(
      OnUpdateFieldMultiple event, Emitter<CustomMultipleTextFieldState> emit) {
    List<TextEditingController> updatedControllerList =
        List.from(state.controllerList ?? []);
    if (event.index >= 0 && event.index < updatedControllerList.length) {
      updatedControllerList[event.index] =
          TextEditingController(text: event.value);
      emit(state.copyWith(controllerList: updatedControllerList));
    }
  }

  FutureOr<void> onChangeObscureTextMultiple(OnChangeObscureTextMultiple event,
      Emitter<CustomMultipleTextFieldState> emit) {
    List<bool> updatedObscureTextList = List.from(state.obscureTextList);
    if (event.index >= 0 && event.index < updatedObscureTextList.length) {
      updatedObscureTextList[event.index] = event.obscureText;
      emit(state.copyWith(obscureTextList: updatedObscureTextList));
    }
  }
}
