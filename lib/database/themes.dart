import 'package:hive/hive.dart';

part 'themes.g.dart';

@HiveType(typeId: 0)
class Themes{
  Themes({required this.themeMode});
  
  @HiveField(0)
  String themeMode;
}