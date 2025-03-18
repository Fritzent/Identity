part of 'custome_text_field_bloc.dart';

@immutable
sealed class CustomeTextFieldEvent {}

class OnFocusChange extends CustomeTextFieldEvent {
  final bool isFocused;

  OnFocusChange(this.isFocused);
}

class OnTextChange extends CustomeTextFieldEvent {
  final bool isEmpty;
  final String value;

  OnTextChange(this.isEmpty, this.value);
}

class OnUpdateField extends CustomeTextFieldEvent {
  final String value;
  OnUpdateField (this.value);
}
