part of 'register_auth_bloc.dart';

@immutable
sealed class RegisterAuthEvent {}

class OnRegisterAuth extends RegisterAuthEvent {
  final BuildContext context;
  OnRegisterAuth(this.context);
}

class OnFieldTextChanges extends RegisterAuthEvent {
  final String textValue;
  final String formSection;
  final BuildContext context;
  OnFieldTextChanges(this.textValue, this.formSection, this.context);
}
