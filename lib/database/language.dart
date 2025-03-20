import 'dart:ui';

import 'package:hive/hive.dart';

part 'language.g.dart';

@HiveType(typeId: 1)
class Language{
  Language({required this.locale});
  
  @HiveField(0)
  Locale locale;
}