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
      final stepperCollection =
          FirebaseFirestore.instance.collection('DataStepper');
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final docSnapshot = await stepperCollection.doc(user.uid).get();

        if (docSnapshot.exists) {
          final dataStepper =
              data_stepper.DataStepper.fromJson(docSnapshot.data()!);

          if (dataStepper.onProgressDataStep == 'step_one') {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.bioFormName);
          } else if (dataStepper.onProgressDataStep == 'step_two') {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.cvFormName);
          } else if (dataStepper.onProgressDataStep == 'step_three') {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.urlFormName);
          } else {
            GoRouter.of(context).pushReplacementNamed(
                IdentityRouteConstant.registrationSuccessName);
          }
        }
      }
    } catch (e) {}
  }

  FutureOr<void> checkStepperData(BuildContext context) async {
    try {
      final stepperCollection =
          FirebaseFirestore.instance.collection('DataStepper');
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final docSnapshot = await stepperCollection.doc(user.uid).get();

        if (docSnapshot.exists) {
          final dataStepper =
              data_stepper.DataStepper.fromJson(docSnapshot.data()!);

          if (dataStepper.onProgressDataStep == 'step_one') {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.bioFormName);
          } else if (dataStepper.onProgressDataStep == 'step_two') {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.cvFormName);
          } else if (dataStepper.onProgressDataStep == 'step_three') {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.urlFormName);
          } else {
            GoRouter.of(context)
                .pushReplacementNamed(IdentityRouteConstant.mainDashboard);
          }
        } else {
          GoRouter.of(context)
              .pushReplacementNamed(IdentityRouteConstant.registerDataChoose);
        }
      }
    } catch (e) {}
  }
}
