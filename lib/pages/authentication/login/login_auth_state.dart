part of 'login_auth_bloc.dart';

class LoginAuthState {
  final String emailTxt;
  final String passwordTxt;
  final bool isValidDataForm;
  final List<Map<String, String>> fieldErrorComponent;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final bool isLoginDone;
  final bool isDeviceUnSupported;
  final bool isPopUpShow;

  LoginAuthState({
    this.emailTxt = '',
    this.passwordTxt = '',
    this.isValidDataForm = false,
    List<Map<String, String>>? fieldErrorComponent,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
    this.isLoginDone = false,
    this.isDeviceUnSupported = false,
    this.isPopUpShow = false,
  }) : fieldErrorComponent = fieldErrorComponent ?? [];

  LoginAuthState copyWith({
    String? emailTxt,
    String? passwordTxt,
    bool? isValidDataForm,
    List<Map<String, String>>? fieldErrorComponent,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    bool? isLoginDone,
    bool? isDeviceUnSupported,
    bool? isPopUpShow,
  }) {
    return LoginAuthState(
      emailTxt: emailTxt ?? this.emailTxt,
      passwordTxt: passwordTxt ?? this.passwordTxt,
      isValidDataForm: isValidDataForm ?? this.isValidDataForm,
      fieldErrorComponent: fieldErrorComponent ?? this.fieldErrorComponent,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoginDone: isLoginDone ?? this.isLoginDone,
      isDeviceUnSupported: isDeviceUnSupported ?? this.isDeviceUnSupported,
      isPopUpShow: isPopUpShow ?? this.isPopUpShow,
    );
  }
}
