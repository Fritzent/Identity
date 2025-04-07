import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/model/user_model.dart';
import 'package:identity/repository/auth_repository.dart';
import 'package:uuid/uuid.dart';

import '../database/user.dart' as UserModelHive;

part 'register_auth_event.dart';
part 'register_auth_state.dart';

class RegisterAuthBloc extends Bloc<RegisterAuthEvent, RegisterAuthState> {
  final Box userBox = Hive.box('userBox');
  final AuthRepository authRepository;

  RegisterAuthBloc({required this.authRepository})
      : super(RegisterAuthState()) {
    on<OnRegisterAuth>(onRegisterAuth);
    on<OnFieldTextChanges>(onFieldTextChanges);
    on<OnGoogleSignInAuth>(onGoogleSignInAuth);
  }

  FutureOr<void> onGoogleSignInAuth(
      OnGoogleSignInAuth event, Emitter<RegisterAuthState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      if (!kIsWeb && Platform.isIOS) {
        emit(state.copyWith(
          isLoading: false,
          isError: true,
          isDeviceUnSupported: true,
          errorMessage:
              AppLocalizations.of(event.context)!.iosGoogleSignUnSupported,
        ));
      } else {
        final user = await authRepository.googleSignIn();
        if (user != null) {
          var uuid = Uuid();
          String userId = uuid.v4();
          UserModels userGoogle = UserModels(
              username: user.displayName.toString(),
              email: user.email.toString(),
              userId: userId,
              authUserId: user.uid);
          await saveUserToDatabase(userGoogle);

          UserModelHive.User userGoogleHive = UserModelHive.User(
              userId: userId,
              username: user.displayName.toString(),
              email: user.email.toString());

          await userBox.add(userGoogleHive);
          emit(state.copyWith(
              isLoading: false,
              isError: false,
              errorMessage: '',
              isDeviceUnSupported: false,
              isRegistrationDone: true));
        } else {
          emit(state.copyWith(
            isLoading: false,
            isError: true,
            isDeviceUnSupported: false,
            errorMessage:
                AppLocalizations.of(event.context)!.registrationFailed,
          ));
        }
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
          isError: true,
          isDeviceUnSupported: false));
    }
  }

  FutureOr<void> onRegisterAuth(
      OnRegisterAuth event, Emitter<RegisterAuthState> emit) async {
    await validateForm(emit, event.context);

    if (state.isValidDataForm) {
      emit(state.copyWith(isLoading: true));
      try {
        final user =
            await authRepository.register(state.emailTxt, state.passwordTxt);
        if (user != null) {
          var uuid = Uuid();
          String userId = uuid.v4();
          UserModels userModel = UserModels(
              username: state.nameTxt,
              email: state.emailTxt,
              userId: userId,
              authUserId: user.uid);
          await saveUserToDatabase(userModel);

          UserModelHive.User userHive = UserModelHive.User(
              username: state.nameTxt, email: state.emailTxt, userId: userId);

          await userBox.add(userHive);
          emit(state.copyWith(
              isLoading: false,
              isError: false,
              errorMessage: '',
              isRegistrationDone: true));
        } else {
          emit(state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage:
                AppLocalizations.of(event.context)!.registrationFailed,
          ));
        }
      } catch (e) {
        emit(state.copyWith(
            isLoading: false, errorMessage: e.toString(), isError: true));
      }
    }
  }

  FutureOr<void> onFieldTextChanges(
      OnFieldTextChanges event, Emitter<RegisterAuthState> emit) {
    if (event.formSection == AppLocalizations.of(event.context)!.fullNameText) {
      if (event.textValue.isNotEmpty) {
        emit(state.copyWith(
            nameTxt: event.textValue,
            fieldErrorComponent: state.fieldErrorComponent
                .where((error) => !error.containsKey(event.formSection))
                .toList()));
      } else {
        emit(state.copyWith(
            nameTxt: '',
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
        AppLocalizations.of(event.context)!.emailText) {
      if (event.textValue.isNotEmpty) {
        bool isValidEmail = validateEmail(event.textValue);

        if (isValidEmail) {
          emit(state.copyWith(
              emailTxt: event.textValue,
              fieldErrorComponent: state.fieldErrorComponent
                  .where((error) => !error.containsKey(event.formSection))
                  .toList()));
        } else {
          emit(state.copyWith(
              emailTxt: '',
              isValidDataForm: false,
              fieldErrorComponent: [
                ...state.fieldErrorComponent,
                {
                  event.formSection:
                      AppLocalizations.of(event.context)!.emailFormatNotCorrect
                }
              ]));
        }
      } else {
        emit(state.copyWith(
            emailTxt: '',
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
        AppLocalizations.of(event.context)!.createPasswordText) {
      if (event.textValue.isNotEmpty) {
        bool isValidPassword = validatePassword(event.textValue);
        if (isValidPassword) {
          emit(state.copyWith(
              passwordTxt: event.textValue,
              fieldErrorComponent: state.fieldErrorComponent
                  .where((error) => !error.containsKey(event.formSection))
                  .toList()));
        } else {
          emit(state.copyWith(
              passwordTxt: '',
              isValidDataForm: false,
              fieldErrorComponent: [
                ...state.fieldErrorComponent,
                {
                  event.formSection: AppLocalizations.of(event.context)!
                      .passwordWeakErrorMessage
                }
              ]));
        }
      } else {
        emit(state.copyWith(
            passwordTxt: '',
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
        AppLocalizations.of(event.context)!.confirmPasswordText) {
      if (event.textValue.isNotEmpty) {
        if (event.textValue == state.passwordTxt) {
          emit(state.copyWith(
              confirmPasswordTxt: event.textValue,
              fieldErrorComponent: state.fieldErrorComponent
                  .where((error) => !error.containsKey(event.formSection))
                  .toList()));
        } else {
          emit(state.copyWith(
              confirmPasswordTxt: '',
              isValidDataForm: false,
              fieldErrorComponent: [
                ...state.fieldErrorComponent,
                {
                  event.formSection: AppLocalizations.of(event.context)!
                      .passwordNotMatchErrorMessage
                }
              ]));
        }
      } else {
        emit(state.copyWith(
            confirmPasswordTxt: '',
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

  bool validatePassword(String password) {
    final strongPasswordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');

    return strongPasswordRegex.hasMatch(password);
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }

  Future<void> validateForm(
      Emitter<RegisterAuthState> emit, BuildContext context) async {
    if ((state.nameTxt.isNotEmpty &&
            state.emailTxt.isNotEmpty &&
            state.passwordTxt.isNotEmpty &&
            state.confirmPasswordTxt.isNotEmpty) &&
        (state.passwordTxt == state.confirmPasswordTxt)) {
      emit(state.copyWith(isValidDataForm: true, fieldErrorComponent: []));
    } else {
      List<Map<String, String>> updatedFieldErrorComponent =
          state.fieldErrorComponent;

      if (state.nameTxt.isEmpty) {
        if (updatedFieldErrorComponent.isNotEmpty) {
          updatedFieldErrorComponent.removeWhere((error) =>
              error.containsKey(AppLocalizations.of(context)!.fullNameText));
        }

        updatedFieldErrorComponent.add({
          AppLocalizations.of(context)!.fullNameText:
              AppLocalizations.of(context)!.textFieldErrorEmptyMessage(
                  AppLocalizations.of(context)!.fullNameText)
        });

        emit(state.copyWith(
            isValidDataForm: false,
            fieldErrorComponent: updatedFieldErrorComponent));
      }
      if (state.emailTxt.isEmpty) {
        if (updatedFieldErrorComponent.isNotEmpty) {
          updatedFieldErrorComponent.removeWhere((error) =>
              error.containsKey(AppLocalizations.of(context)!.emailText));
        }

        updatedFieldErrorComponent.add({
          AppLocalizations.of(context)!.emailText: AppLocalizations.of(context)!
              .textFieldErrorEmptyMessage(
                  AppLocalizations.of(context)!.emailText)
        });

        emit(state.copyWith(
            isValidDataForm: false,
            fieldErrorComponent: updatedFieldErrorComponent));
      }
      if (state.passwordTxt.isEmpty) {
        if (updatedFieldErrorComponent.isNotEmpty) {
          updatedFieldErrorComponent.removeWhere((error) => error
              .containsKey(AppLocalizations.of(context)!.createPasswordText));
        }

        updatedFieldErrorComponent.add({
          AppLocalizations.of(context)!.createPasswordText:
              AppLocalizations.of(context)!.textFieldErrorEmptyMessage(
                  AppLocalizations.of(context)!.createPasswordText)
        });

        emit(state.copyWith(
            isValidDataForm: false,
            fieldErrorComponent: updatedFieldErrorComponent));
      }
      if (state.confirmPasswordTxt.isEmpty) {
        if (updatedFieldErrorComponent.isNotEmpty) {
          updatedFieldErrorComponent.removeWhere((error) => error
              .containsKey(AppLocalizations.of(context)!.confirmPasswordText));
        }

        updatedFieldErrorComponent.add({
          AppLocalizations.of(context)!.confirmPasswordText:
              AppLocalizations.of(context)!.textFieldErrorEmptyMessage(
                  AppLocalizations.of(context)!.confirmPasswordText)
        });

        emit(state.copyWith(
            isValidDataForm: false,
            fieldErrorComponent: updatedFieldErrorComponent));
      }
    }
  }

  Future<void> saveUserToDatabase(UserModels user) async {
    try {
      final userCollection = FirebaseFirestore.instance.collection('Users');
      await userCollection.doc(user.authUserId).set({
        'username': user.username,
        'email': user.email,
        'user_id': user.userId,
        'authUserId': user.authUserId,
        'uid': FirebaseAuth.instance.currentUser!.uid,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
