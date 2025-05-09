import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:identity/l10n/app_localizations.dart';

part 'register_bio_form_event.dart';
part 'register_bio_form_state.dart';

class RegisterBioFormBloc
    extends Bloc<RegisterBioFormEvent, RegisterBioFormState> {
  final Box userBox = Hive.box('userBox');
  RegisterBioFormBloc() : super(RegisterBioFormState()) {
    on<OnFieldTextChanges>(onFieldTextChanges);
    on<OnSubmitDataBio>(onSubmitDataBio);
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

  FutureOr<void> onSubmitDataBio(
      OnSubmitDataBio event, Emitter<RegisterBioFormState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await saveBioDataToDatabase();
      await updatedDataStepper(emit);
      emit(state.copyWith(
          isLoading: false,
          isError: false,
          errorMessage: '',
          isRegisterBioDone: true));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
          isRegisterBioDone: false));
    }
  }

  FutureOr<void> saveBioDataToDatabase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final bioCollection = FirebaseFirestore.instance.collection('BioForm');
        if (userBox.isNotEmpty) {
          var firstKey = userBox.keys.first;
          var firstValue = userBox.get(firstKey);
          await bioCollection.doc(user.uid).set({
            'uid': user.uid,
            'userId': firstValue.userId,
            'profesional_name': state.profesionalName,
            'user_about': state.userAbout,
            'date_birth': state.dateBirth,
            'job_position': state.jobPosition,
            'experience_years': state.experienceYears,
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> updatedDataStepper(Emitter<RegisterBioFormState> emit) async {
    try {
      String onProgressDataStep = "step_two";
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('DataStepper')
            .doc(user.uid)
            .update({
          'onprogress_data_step': onProgressDataStep,
        });
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
          isRegisterBioDone: false));
    }
  }
}
