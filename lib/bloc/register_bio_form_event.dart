part of 'register_bio_form_bloc.dart';

@immutable
sealed class RegisterBioFormEvent {}

class OnSubmitDataBio extends RegisterBioFormEvent {
  final BuildContext context;
  OnSubmitDataBio(this.context);
}

class OnFieldTextChanges extends RegisterBioFormEvent {
  final String textValue;
  final String formSection;
  final BuildContext context;
  OnFieldTextChanges(this.textValue, this.formSection, this.context);
}