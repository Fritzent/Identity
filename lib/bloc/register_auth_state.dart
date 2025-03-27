part of 'register_auth_bloc.dart';

class RegisterAuthState {
  final String nameTxt;
  final String emailTxt;
  final String passwordTxt;
  final String confirmPasswordTxt;
  final bool isLoading;
  final bool isError;
  final String errorMessage;

  RegisterAuthState({
    this.nameTxt = '',
    this.emailTxt = '',
    this.passwordTxt = '',
    this.confirmPasswordTxt = '',
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
  });

  RegisterAuthState copyWith({
    String? nameTxt,
    String? emailTxt,
    String? passwordTxt,
    String? confirmPasswordTxt,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
  }) {
    return RegisterAuthState(
      nameTxt: nameTxt ?? this.nameTxt,
      emailTxt: emailTxt ?? this.emailTxt,
      passwordTxt: passwordTxt ?? this.passwordTxt,
      confirmPasswordTxt: confirmPasswordTxt ?? this.confirmPasswordTxt,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
