import 'package:hive/hive.dart';

part 'data_stepper.g.dart';

@HiveType(typeId: 4)
class DataStepper extends HiveObject {
  @HiveField(0)
  final String onProgressDataStep;

  @HiveField(1)
  final bool isStepOneSelected;

  @HiveField(2)
  final bool isStepTwoSelected;

  @HiveField(3)
  final List<String> listStepThirdSelected;

  DataStepper({
    required this.onProgressDataStep,
    required this.isStepOneSelected,
    required this.isStepTwoSelected,
    required this.listStepThirdSelected,
  });
}
