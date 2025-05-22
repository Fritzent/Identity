import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:identity/services/selected_page_service.dart';

class SelectedDataRepository {
  final SelectedPageService selectedPageService;

  SelectedDataRepository(this.selectedPageService);

  FutureOr<void> checkPage(BuildContext context) {
    return selectedPageService.checkNextPage(context);
  }

  FutureOr<void> checkStepperData(BuildContext context) {
    return selectedPageService.checkStepperData(context);
  }
}