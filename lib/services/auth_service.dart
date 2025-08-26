import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:identity/l10n/app_localizations.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static bool isStrongPassword(String password) {
    final strongPasswordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');

    return strongPasswordRegex.hasMatch(password);
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }

  Future<User?> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User?> loginWithEmail(String email, String password, BuildContext context) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception(AppLocalizations.of(context)!.userNotFound);
        case 'wrong-password':
          throw Exception(AppLocalizations.of(context)!.wrongPassword);
        case 'invalid-email':
          throw Exception(AppLocalizations.of(context)!.invalidEmail);
        case 'invalid-credential':
          throw Exception(AppLocalizations.of(context)!.userNotFound);
        default:
          throw Exception(AppLocalizations.of(context)!.loginFailedWithMessage(e.message.toString()));
      }
    } catch (e) {
      throw Exception(AppLocalizations.of(context)!.unexpectedErrorLogin(e.toString()));
    }
  }

  Future<User?> signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      UserCredential userCredential =
          await _auth.signInWithPopup(googleProvider);
      return userCredential.user;
    } else if (!kIsWeb && Platform.isIOS) {
      return null;
    } else {
      try {
        final googleSignInInit = GoogleSignIn.instance;
        await googleSignInInit.initialize();
        GoogleSignInAccount? googleUser = await googleSignInInit.authenticate();

        if (googleUser == null) return null;

        final googleAuth = googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.idToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        return userCredential.user;
      } catch (e) {
        return null;
      }
    }
  }
}
