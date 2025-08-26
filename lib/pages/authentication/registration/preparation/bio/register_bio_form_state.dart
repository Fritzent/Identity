part of 'register_bio_form_bloc.dart';

class RegisterBioFormState {
  final String userId;
  final String profesionalName;
  final String userAbout;
  final DateTime dateBirth;
  final String jobPosition;
  final String experienceYears;
  final bool isValidDataForm;
  final List<Map<String, String>> fieldErrorComponent;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final bool isRegisterBioDone;

  RegisterBioFormState({
    this.userId = '',
    this.profesionalName = '',
    this.userAbout = '',
    DateTime? dateBirth,
    this.jobPosition = '',
    this.experienceYears = '',
    this.isValidDataForm = false,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    this.isRegisterBioDone = false,
    List<Map<String, String>>? fieldErrorComponent,
  })  : dateBirth = dateBirth ?? DateTime.now(),
        fieldErrorComponent = fieldErrorComponent ?? [];

  RegisterBioFormState copyWith({
    String? userId,
    String? profesionalName,
    String? userAbout,
    DateTime? dateBirth,
    String? jobPosition,
    String? experienceYears,
    bool? isValidDataForm,
    List<Map<String, String>>? fieldErrorComponent,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    bool? isRegisterBioDone,
  }) {
    return RegisterBioFormState(
      userId: userId ?? this.userId,
      profesionalName: profesionalName ?? this.profesionalName,
      userAbout: userAbout ?? this.userAbout,
      dateBirth: dateBirth ?? this.dateBirth,
      jobPosition: jobPosition ?? this.jobPosition,
      experienceYears: experienceYears ?? this.experienceYears,
      isValidDataForm: isValidDataForm ?? this.isValidDataForm,
      fieldErrorComponent: fieldErrorComponent ?? this.fieldErrorComponent,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      isRegisterBioDone: isRegisterBioDone ?? this.isRegisterBioDone,
    );
  }
}
