import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:identity/data/section_data_items.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/model/data_stepper_model.dart' as data_stepper;

part 'personal_url_event.dart';
part 'personal_url_state.dart';

class PersonalUrlBloc extends Bloc<PersonalUrlEvent, PersonalUrlState> {
  bool isLinkedInVisible = false;
  bool isInstagramVisible = false;
  bool isWebsiteVisible = false;
  bool isProjectVisible = false;
  final Box userBox = Hive.box('userBox');
  PersonalUrlBloc() : super(PersonalUrlState()) {
    on<OnSubmitDataUrl>(onSubmitDataUrl);
    on<OnFieldTextChanges>(onFieldTextChanges);
    on<OnValidateFormVisible>(onValidateFormVisible);
  }

  FutureOr<void> onValidateFormVisible(
      OnValidateFormVisible event, Emitter<PersonalUrlState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final stepperCollection =
          FirebaseFirestore.instance.collection('DataStepper');
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final docSnapshot = await stepperCollection.doc(user.uid).get();

        if (docSnapshot.exists) {
          final dataStepper =
              data_stepper.DataStepper.fromJson(docSnapshot.data()!);
          if (dataStepper.listStepThirdSelected != null) {
            for (final section in dataStepper.listStepThirdSelected!) {
              if (section == sectionItemData[2].sectionName) {
                isLinkedInVisible = true;
              } else if (section == sectionItemData[3].sectionName) {
                isInstagramVisible = true;
              } else if (section == sectionItemData[4].sectionName) {
                isWebsiteVisible = true;
              } else if (section == sectionItemData[5].sectionName) {
                isProjectVisible = true;
              }
            }
            emit(state.copyWith(
                isLoading: false,
                isError: false,
                errorMessage: '',
                isLinkedInVisible: isLinkedInVisible,
                isInstagramVisible: isInstagramVisible,
                isWebsiteVisible: isWebsiteVisible,
                isProjectVisible: isProjectVisible));
          } else {
            emit(state.copyWith(
                isLoading: false,
                isError: true,
                errorMessage: 'List Personal Url Document not Found'));
          }
        }
      } else {
        emit(state.copyWith(
            isLoading: false, isError: true, errorMessage: 'User Not Found'));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, isError: true, errorMessage: e.toString()));
    }
  }

  FutureOr<void> onFieldTextChanges(
      OnFieldTextChanges event, Emitter<PersonalUrlState> emit) {
    if (event.formSection == AppLocalizations.of(event.context)!.linkedIn) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            linkedInUrl: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            linkedInUrl: '',
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
        AppLocalizations.of(event.context)!.instagram) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            instagramUrl: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            instagramUrl: '',
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
        AppLocalizations.of(event.context)!.website) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            websiteUrl: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            websiteUrl: '',
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
        AppLocalizations.of(event.context)!.project) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            projectUrl: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            projectUrl: '',
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

  FutureOr<void> onSubmitDataUrl(
      OnSubmitDataUrl event, Emitter<PersonalUrlState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await savePersonalUrlToDatabase();
      await updatedDataStepper(emit);
      emit(state.copyWith(
          isLoading: false,
          isError: false,
          errorMessage: '',
          isRegisterLinkDone: true));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
          isRegisterLinkDone: false));
    }
  }

  FutureOr<void> savePersonalUrlToDatabase() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final personalLinkCollection =
            FirebaseFirestore.instance.collection('PersonalLink');
        if (userBox.isNotEmpty) {
          var firstKey = userBox.keys.first;
          var firstValue = userBox.get(firstKey);
          await personalLinkCollection.doc(user.uid).set({
            'uid': user.uid,
            'userId': firstValue.userId,
            'linkedin': state.linkedInUrl,
            'instagram': state.instagramUrl,
            'website': state.websiteUrl,
            'project': state.projectUrl
          });
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
  FutureOr<void> updatedDataStepper(Emitter<PersonalUrlState> emit) async {
    try {
      String onProgressDataStep = 'done';
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
          isRegisterLinkDone: false));
    }
  }
}
