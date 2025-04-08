import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';

part 'register_bio_form_event.dart';
part 'register_bio_form_state.dart';

class RegisterBioFormBloc
    extends Bloc<RegisterBioFormEvent, RegisterBioFormState> {
  RegisterBioFormBloc() : super(RegisterBioFormState()) {
    on<OnFieldTextChanges>(onFieldTextChanges);
  }
  FutureOr<void> onFieldTextChanges(
      OnFieldTextChanges event, Emitter<RegisterBioFormState> emit) {
    if (event.formSection ==
        AppLocalizations.of(event.context)!.professionalTitle) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            profesionalName: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            profesionalName: '',
            isValidDataForm: false,
            fieldErrorComponent: [
              ...state.fieldErrorComponent,
              {
                event.formSection: AppLocalizations.of(event.context)!
                    .textFieldErrorEmptyMessage(event.formSection)
              }
            ]));
      }
    } else if (event.formSection ==
        AppLocalizations.of(event.context)!.tellUsAboutTitle) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            userAbout: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            userAbout: '',
            isValidDataForm: false,
            fieldErrorComponent: [
              ...state.fieldErrorComponent,
              {
                event.formSection: AppLocalizations.of(event.context)!
                    .textFieldErrorEmptyMessage(event.formSection)
              }
            ]));
      }
    } else if (event.formSection ==
        AppLocalizations.of(event.context)!.dateOfBirthTitle) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            dateBirth: DateTime.parse(event.textValue),
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            dateBirth: null,
            isValidDataForm: false,
            fieldErrorComponent: [
              ...state.fieldErrorComponent,
              {
                event.formSection: AppLocalizations.of(event.context)!
                    .textFieldErrorEmptyMessage(event.formSection)
              }
            ]));
      }
    } else if (event.formSection ==
        AppLocalizations.of(event.context)!.currentLastJobTitle) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            jobPosition: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            jobPosition: '',
            isValidDataForm: false,
            fieldErrorComponent: [
              ...state.fieldErrorComponent,
              {
                event.formSection: AppLocalizations.of(event.context)!
                    .textFieldErrorEmptyMessage(event.formSection)
              }
            ]));
      }
    } else if (event.formSection ==
        AppLocalizations.of(event.context)!.lengthOfWorkExperienceTitle) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            experienceYears: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            experienceYears: '',
            isValidDataForm: false,
            fieldErrorComponent: [
              ...state.fieldErrorComponent,
              {
                event.formSection: AppLocalizations.of(event.context)!
                    .textFieldErrorEmptyMessage(event.formSection)
              }
            ]));
      }
    }
  }
}
