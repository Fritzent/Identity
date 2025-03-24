import 'package:hive/hive.dart';

part 'cv.g.dart';

@HiveType(typeId: 2)
class CvPdfFile extends HiveObject {
  @HiveField(0)
  String fileName;

  @HiveField(1)
  List<int> fileBytes;

  CvPdfFile({required this.fileName, required this.fileBytes});
}