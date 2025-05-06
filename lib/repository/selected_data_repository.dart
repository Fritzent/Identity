import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:identity/model/section_data_item.dart';
import 'package:identity/services/selected_page_service.dart';

class SelectedDataRepository {
  final SelectedPageService selectedPageService;

  SelectedDataRepository(this.selectedPageService);

  FutureOr<void> checkPage(List<SectionItemData> data, BuildContext context) {
    return selectedPageService.checkNextPage(data, context);
  }
}