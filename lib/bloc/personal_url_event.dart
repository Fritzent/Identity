part of 'personal_url_bloc.dart';

@immutable
sealed class PersonalUrlEvent {}

class OnSubmitDataUrl extends PersonalUrlEvent {
  final BuildContext context;
  OnSubmitDataUrl(this.context);
}

class OnFieldTextChanges extends PersonalUrlEvent {
  final String textValue;
  final String formSection;
  final BuildContext context;
  OnFieldTextChanges(this.textValue, this.formSection, this.context);
}

class OnValidateFormVisible extends PersonalUrlEvent {}
