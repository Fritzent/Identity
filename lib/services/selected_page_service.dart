import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/data/section_data_items.dart';
import 'package:identity/model/section_data_item.dart';
import 'package:identity/routes/app_route_constants.dart';

class SelectedPageService {
  FutureOr<void> checkNextPage(
      List<SectionItemData> data, BuildContext context) {
    try {
      if (data
          .any((item) => item.sectionName == sectionItemData[0].sectionName)) {
        GoRouter.of(context)
            .pushReplacementNamed(IdentityRouteConstant.bioFormName);
      } else if (data
          .any((item) => item.sectionName == sectionItemData[1].sectionName)) {
        GoRouter.of(context)
            .pushReplacementNamed(IdentityRouteConstant.cvFormName);
      } else {
        final stepThreeNames =
            sectionItemData.sublist(2, 6).map((e) => e.sectionName).toList();

        List<String> listStepThirdSelected = data
            .where((item) => stepThreeNames.contains(item.sectionName))
            .map((item) => item.sectionName)
            .toList();

        if (listStepThirdSelected.isNotEmpty) {
          GoRouter.of(context)
              .pushReplacementNamed(IdentityRouteConstant.urlFormName);
        }
      }
    } catch (e) {}
  }
}
