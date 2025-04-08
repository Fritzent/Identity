import 'dart:convert';

List<BioModels> bioModelsFromJson(String str) =>
    List<BioModels>.from(json.decode(str).map((x) => BioModels.fromJson(x)));

String bioModelsToJson(List<BioModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BioModels {
  final String userId;
  final String profesionalName;
  final String userAbout;
  final DateTime dateBirth;
  final String jobPosition;
  final String experienceYears;

  BioModels({
    required this.userId,
    required this.profesionalName,
    required this.userAbout,
    required this.dateBirth,
    required this.jobPosition,
    required this.experienceYears,
  });

  BioModels copyWith({
    String? userId,
    String? profesionalName,
    String? userAbout,
    DateTime? dateBirth,
    String? jobPosition,
    String? experienceYears,
  }) => BioModels(
    userId: userId ?? this.userId,
    profesionalName: profesionalName ?? this.profesionalName,
    userAbout: userAbout ?? this.userAbout,
    dateBirth: dateBirth ?? this.dateBirth,
    jobPosition: jobPosition ?? this.jobPosition,
    experienceYears: experienceYears ?? this.experienceYears,
  );

  factory BioModels.fromJson(Map<String, dynamic> json) => BioModels(
    userId: json["user_id"],
    profesionalName: json["profesional_name"],
    userAbout: json["user_about"],
    dateBirth: json["date_birth"],
    jobPosition: json["job_position"],
    experienceYears: json["experience_years"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "profesional_name": profesionalName,
    "user_about": userAbout,
    "date_birth": dateBirth,
    "job_position": jobPosition,
    "experience_years": experienceYears,
  };
}