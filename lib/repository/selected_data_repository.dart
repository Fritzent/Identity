import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:identity/services/selected_page_service.dart';

class SelectedDataRepository {
  final SelectedPageService selectedPageService;

  SelectedDataRepository(this.selectedPageService);

  FutureOr<void> checkPage(BuildContext context, String stepPage) {
    return selectedPageService.checkNextPage(context, stepPage);
  }
}