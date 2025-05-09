import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/model/data_stepper_model.dart' as data_stepper;
import 'package:identity/routes/app_route_constants.dart';

class SelectedPageService {
  FutureOr<void> checkNextPage(BuildContext context, String stepPage) async {
    try {
      bool isBioSkip = stepPage == 'BioFormPage' ||
              stepPage == 'CVFormPage' ||
              stepPage == 'LinkUrlFormPage'
          ? true
          : false;
      bool isCvSkip = stepPage == 'CVFormPage' || stepPage == 'LinkUrlFormPage'
          ? true
          : false;

      final stepperCollection =
          FirebaseFirestore.instance.collection('DataStepper');
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final docSnapshot = await stepperCollection.doc(user.uid).get();

        if (docSnapshot.exists) {
          final dataStepper =
              data_stepper.DataStepper.fromJson(docSnapshot.data()!);

          if (dataStepper.isStepOneSelected && !isBioSkip) {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.bioFormName);
          } else if (dataStepper.isStepTwoSelected && !isCvSkip) {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.cvFormName);
          } else {
            if (dataStepper.listStepThirdSelected?.isNotEmpty ?? false) {
              GoRouter.of(context)
                  .pushReplacementNamed(IdentityRouteConstant.urlFormName);
            }
          }
        }
      }
    } catch (e) {}
  }
}
