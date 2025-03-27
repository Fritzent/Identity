import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_auth_event.dart';
part 'register_auth_state.dart';

class RegisterAuthBloc extends Bloc<RegisterAuthEvent, RegisterAuthState> {
  RegisterAuthBloc() : super(RegisterAuthState()) {
    on<OnRegisterAuth>(onRegisterAuth);
  }

  FutureOr<void> onRegisterAuth(OnRegisterAuth event, Emitter<RegisterAuthState> emit) async {
    
  }
}
