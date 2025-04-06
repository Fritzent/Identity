part of 'register_auth_bloc.dart';

class RegisterAuthState {
  final String nameTxt;
  final String emailTxt;
  final String passwordTxt;
  final String confirmPasswordTxt;
  final bool isValidDataForm;
  final List<Map<String, String>> fieldErrorComponent;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final bool isRegistrationDone;
  final bool isDeviceUnSupported;

  RegisterAuthState({
    this.nameTxt = '',
    this.emailTxt = '',
    this.passwordTxt = '',
    this.confirmPasswordTxt = '',
    this.isValidDataForm = false,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    List<Map<String, String>>? fieldErrorComponent,
    this.isRegistrationDone = false,
    this.isDeviceUnSupported = false,
  }): fieldErrorComponent = fieldErrorComponent ?? [];

  RegisterAuthState copyWith({
    String? nameTxt,
    String? emailTxt,
    String? passwordTxt,
    String? confirmPasswordTxt,
    bool? isValidDataForm,
    List<Map<String, String>>? fieldErrorComponent,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    bool? isRegistrationDone,
    bool? isDeviceUnSupported,
  }) {
    return RegisterAuthState(
      nameTxt: nameTxt ?? this.nameTxt,
      emailTxt: emailTxt ?? this.emailTxt,
      passwordTxt: passwordTxt ?? this.passwordTxt,
      confirmPasswordTxt: confirmPasswordTxt ?? this.confirmPasswordTxt,
      isValidDataForm: isValidDataForm ?? this.isValidDataForm,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      fieldErrorComponent : fieldErrorComponent ?? this.fieldErrorComponent,
      isRegistrationDone: isRegistrationDone ?? this.isRegistrationDone,
      isDeviceUnSupported : isDeviceUnSupported ?? this.isDeviceUnSupported,
    );
  }
}
