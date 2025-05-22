import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:identity/data/section_data_items.dart';
import 'package:identity/model/section_data_item.dart';

import '../database/data_stepper.dart' as DataStepperHive;

part 'register_data_selected_event.dart';
part 'register_data_selected_state.dart';

class RegisterDataSelectedBloc
    extends Bloc<RegisterDataSelectedEvent, RegisterDataSelectedState> {
  final Box dataStepperBox = Hive.box('dataStepperBox');

  RegisterDataSelectedBloc()
      : super(RegisterDataSelectedState(selectedItems: [])) {
    on<SelectedDataChooseItem>(selectedDataChooseItem);
    on<SaveSelectedDataChoose>(saveSelectedDataChoose);
  }

  FutureOr<void> selectedDataChooseItem(
      SelectedDataChooseItem event, Emitter<RegisterDataSelectedState> emit) {
    final selected = List<SectionItemData>.from(state.selectedItems);
    if (selected.contains(event.items)) {
      selected.remove(event.items);
    } else {
      selected.add(event.items);
    }
    emit(state.copyWith(selectedItems: selected));
  }

  FutureOr<void> saveSelectedDataChoose(SaveSelectedDataChoose event,
      Emitter<RegisterDataSelectedState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      String onProgressDataStep = '';
      bool isStepOneSelected = state.selectedItems
          .any((item) => item.sectionName == sectionItemData[0].sectionName);

      bool isStepTwoSelected = state.selectedItems
          .any((item) => item.sectionName == sectionItemData[1].sectionName);

      final stepThreeNames =
          sectionItemData.sublist(2, 6).map((e) => e.sectionName).toList();

      List<String> listStepThirdSelected = state.selectedItems
          .where((item) => stepThreeNames.contains(item.sectionName))
          .map((item) => item.sectionName)
          .toList();

      if (isStepOneSelected) {
        onProgressDataStep = 'step_one';
      } else if (isStepTwoSelected) {
        onProgressDataStep = 'step_two';
      } else {
        onProgressDataStep = 'step_three';
      }

      DataStepperHive.DataStepper dataStepper = DataStepperHive.DataStepper(
          onProgressDataStep: onProgressDataStep,
          isStepOneSelected: isStepOneSelected,
          isStepTwoSelected: isStepTwoSelected,
          listStepThirdSelected: listStepThirdSelected);

      await saveDataStepperToDatabase(dataStepper);
      await dataStepperBox.add(dataStepper);
      emit(state.copyWith(
          isLoading: false,
          isError: false,
          errorMessage: '',
          isChooseDataDone: true));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
          isChooseDataDone: false));
    }
  }

  Future<void> saveDataStepperToDatabase(
      DataStepperHive.DataStepper dataStepper) async {
    try {
      final stepperCollection =
          FirebaseFirestore.instance.collection('DataStepper');
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await stepperCollection.doc(user.uid).set({
          'uid': user.uid,
          'onprogress_data_step': dataStepper.onProgressDataStep,
          'isStepOneSelected': dataStepper.isStepOneSelected,
          'isStepTwoSelected': dataStepper.isStepTwoSelected,
          'listStepThirdSelected': dataStepper.listStepThirdSelected,
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
