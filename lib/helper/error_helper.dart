import 'package:flutter/widgets.dart';

String getFieldError(
    String field, BuildContext context, List<Map<String, String>> errors) {
  return errors.any((error) => error.containsKey(field))
      ? errors.firstWhere((error) => error.containsKey(field))[field]!
      : '';
}
