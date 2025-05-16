import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:identity/l10n/app_localizations.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final _googleSignIn = GoogleSignIn();

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
        final googleUser = await _googleSignIn.signIn();
        if (googleUser == null) return null;

        final googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
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
