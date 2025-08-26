part of 'login_auth_bloc.dart';

@immutable
sealed class LoginAuthEvent {}

class OnLoginAuth extends LoginAuthEvent {
  final BuildContext context;
  OnLoginAuth(this.context);
}

class OnGoogleSignInAuth extends LoginAuthEvent {
  final BuildContext context;
  OnGoogleSignInAuth(this.context);
}

class OnFieldTextChanges extends LoginAuthEvent {
  final String textValue;
  final String formSection;
  final BuildContext context;
  OnFieldTextChanges(this.textValue, this.formSection, this.context);
}

class OnPopUpShow extends LoginAuthEvent {}
