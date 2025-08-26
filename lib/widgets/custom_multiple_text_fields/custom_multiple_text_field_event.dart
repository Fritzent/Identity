part of 'custom_multiple_text_field_bloc.dart';

@immutable
sealed class CustomMultipleTextFieldEvent {}

class OnInit extends CustomMultipleTextFieldEvent {
  final int numberOfGeneratedFields;
  OnInit(this.numberOfGeneratedFields);
}

class OnFocusChangeMultiple extends CustomMultipleTextFieldEvent {
  final int index;
  final bool isFocused;

  OnFocusChangeMultiple(this.index, this.isFocused);
}

class OnTextChangeMultiple extends CustomMultipleTextFieldEvent {
  final int index;
  final bool isEmpty;
  final String value;
  final BuildContext context;
  final String formSection;

  OnTextChangeMultiple(this.index, this.isEmpty, this.value, this.context, this.formSection);
}

class OnUpdateFieldMultiple extends CustomMultipleTextFieldEvent {
  final int index;
  final String value;
  OnUpdateFieldMultiple (this.index, this.value);
}

class OnChangeObscureTextMultiple extends CustomMultipleTextFieldEvent {
  final int index;
  final bool obscureText;
  OnChangeObscureTextMultiple(this.index, this.obscureText);
}
