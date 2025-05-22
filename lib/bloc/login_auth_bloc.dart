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

part 'login_auth_event.dart';
part 'login_auth_state.dart';

class LoginAuthBloc extends Bloc<LoginAuthEvent, LoginAuthState> {
  final Box userBox = Hive.box('userBox');
  final AuthRepository authRepository;

  LoginAuthBloc({required this.authRepository}) : super(LoginAuthState()) {
    on<OnLoginAuth>(onLoginAuth);
    on<OnFieldTextChanges>(onFieldTextChanges);
    on<OnGoogleSignInAuth>(onGoogleSignInAuth);
    on<OnPopUpShow>(onPopUpShow);
  }

  FutureOr<void> onLoginAuth(
      OnLoginAuth event, Emitter<LoginAuthState> emit) async {
    await validateForm(emit, event.context);

    if (state.isValidDataForm) {
      emit(state.copyWith(isLoading: true));
      try {
        final user =
            await authRepository.login(state.emailTxt, state.passwordTxt, event.context);
        if (user != null) {
          bool isUserExitsOnCollection = await checkIfUserExists(user.uid);
          var uuid = Uuid();
          String userId = uuid.v4();
          if (!isUserExitsOnCollection) {
            UserModels userGoogle = UserModels(
                username: user.displayName.toString(),
                email: user.email.toString(),
                userId: userId,
                authUserId: user.uid);
            await saveUserToDatabase(userGoogle);
          } else {
            final doc = await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .get();

            if (doc.exists) {
              final dataUser = UserModels.fromJson(doc.data()!);
              if (dataUser.userId.isNotEmpty) {
                userId = dataUser.userId;
              }
            }
          }
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
              isLoginDone: true));
        }
      } catch (e) {
        emit(state.copyWith(
            isLoading: false, errorMessage: e.toString(), isError: true));
      }
    }
  }

  Future<void> validateForm(
      Emitter<LoginAuthState> emit, BuildContext context) async {
    if (state.emailTxt.isNotEmpty && state.passwordTxt.isNotEmpty) {
      emit(state.copyWith(isValidDataForm: true, fieldErrorComponent: []));
    } else {
      List<Map<String, String>> updatedFieldErrorComponent =
          state.fieldErrorComponent;

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
          updatedFieldErrorComponent.removeWhere((error) =>
              error.containsKey(AppLocalizations.of(context)!.passwordText));
        }

        updatedFieldErrorComponent.add({
          AppLocalizations.of(context)!.passwordText:
              AppLocalizations.of(context)!.textFieldErrorEmptyMessage(
                  AppLocalizations.of(context)!.passwordText)
        });

        emit(state.copyWith(
            isValidDataForm: false,
            fieldErrorComponent: updatedFieldErrorComponent));
      }
    }
  }

  FutureOr<void> onFieldTextChanges(
      OnFieldTextChanges event, Emitter<LoginAuthState> emit) {
    if (event.formSection == AppLocalizations.of(event.context)!.emailText) {
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
        AppLocalizations.of(event.context)!.passwordText) {
      if (event.textValue.isNotEmpty) {
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
                    .textFieldErrorEmptyMessage(event.formSection)
              }
            ]));
      }
    }
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }

  FutureOr<void> onGoogleSignInAuth(
      OnGoogleSignInAuth event, Emitter<LoginAuthState> emit) async {
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
          bool isUserExitsOnCollection = await checkIfUserExists(user.uid);
          var uuid = Uuid();
          String userId = uuid.v4();
          if (!isUserExitsOnCollection) {
            UserModels userGoogle = UserModels(
                username: user.displayName.toString(),
                email: user.email.toString(),
                userId: userId,
                authUserId: user.uid);
            await saveUserToDatabase(userGoogle);
          } else {
            final doc = await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .get();

            if (doc.exists) {
              final dataUser = UserModels.fromJson(doc.data()!);
              if (dataUser.userId.isNotEmpty) {
                userId = dataUser.userId;
              }
            }
          }

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
              isLoginDone: true));
        } else {
          emit(state.copyWith(
            isLoading: false,
            isError: true,
            isDeviceUnSupported: false,
            errorMessage:
                AppLocalizations.of(event.context)!.registrationFailed,
            isLoginDone: false,
          ));
        }
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
        isError: true,
        isDeviceUnSupported: false,
        isLoginDone: false,
      ));
    }
  }

  Future<bool> checkIfUserExists(String uid) async {
    try {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      return doc.exists;
    } catch (e) {
      print('Error checking user: $e');
      return false;
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

  FutureOr<void>onPopUpShow(OnPopUpShow event, Emitter<LoginAuthState> emit){
    emit(state.copyWith(isPopUpShow: !state.isPopUpShow, isError: false));
  }
}
