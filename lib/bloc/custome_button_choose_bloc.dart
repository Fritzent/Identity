import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custome_button_choose_event.dart';
part 'custome_button_choose_state.dart';

class CustomeButtonChooseBloc extends Bloc<CustomeButtonChooseEvent, CustomeButtonChooseState> {
  CustomeButtonChooseBloc() : super(CustomeButtonChooseState()) {
    on<OnTapped>(onTapped);
  }
  FutureOr<void> onTapped(OnTapped event, Emitter<CustomeButtonChooseState> emit) {
    emit(state.copyWith(isTapped: event.isTapped));
  }
}
