import 'dart:convert';

List<DataStepper> dataStepperFromJson(String str) => List<DataStepper>.from(
    json.decode(str).map((x) => DataStepper.fromJson(x)));

String dataStepperToJson(List<DataStepper> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataStepper {
  final String authUserId;
  final String? onProgressDataStep;
  final bool isStepOneSelected;
  final bool isStepTwoSelected;
  final List<String>? listStepThirdSelected;

  DataStepper({
    required this.authUserId,
    this.onProgressDataStep,
    required this.isStepOneSelected,
    required this.isStepTwoSelected,
    this.listStepThirdSelected,
  });

  DataStepper copyWith({
    String? authUserId,
    String? onProgressDataStep,
    bool? isStepOneSelected,
    bool? isStepTwoSelected,
    List<String>? listStepThirdSelected,
  }) =>
      DataStepper(
        authUserId: authUserId ?? this.authUserId,
        onProgressDataStep: onProgressDataStep ?? this.onProgressDataStep,
        isStepOneSelected: isStepOneSelected ?? this.isStepOneSelected,
        isStepTwoSelected: isStepTwoSelected ?? this.isStepTwoSelected,
        listStepThirdSelected:
            listStepThirdSelected ?? this.listStepThirdSelected,
      );

  factory DataStepper.fromJson(Map<String, dynamic> json) => DataStepper(
        authUserId: json["uid"],
        onProgressDataStep: json["onprogress_data_step"],
        isStepOneSelected: json["isStepOneSelected"],
        isStepTwoSelected: json["isStepTwoSelected"],
        listStepThirdSelected: json["listStepThirdSelected"] == null
            ? []
            : List<String>.from(json["listStepThirdSelected"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uid": authUserId,
        "onprogress_data_step": onProgressDataStep,
        "isStepOneSelected": isStepOneSelected,
        "isStepTwoSelected": isStepTwoSelected,
        "listStepThirdSelected": listStepThirdSelected == null
            ? []
            : List<dynamic>.from(listStepThirdSelected!.map((x) => x)),
      };
}
