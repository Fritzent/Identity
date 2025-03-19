part of 'custome_text_field_bloc.dart';

class CustomeTextFieldState {
  final bool isFocused;
  final bool isEmpty;
  final String errorMessage;
  final String fieldValue;
  final String formSection;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final int countInit;
  final BuildContext? context;


  CustomeTextFieldState({
    this.isFocused = false,
    this.isEmpty = false,
    this.errorMessage = '',
    FocusNode? focusNode,
    TextEditingController? controller,
    this.fieldValue = '',
    this.countInit = 0,
    this.context,
    this.formSection = '',
  }) : controller = controller ?? TextEditingController(
    text: ''),
    focusNode = focusNode ?? FocusNode();

  CustomeTextFieldState copyWith({
    bool? isFocused,
    bool? isEmpty,
    String? errorMessage,
    FocusNode? focusNode,
    TextEditingController? controller,
    String? fieldValue,
    int? countInit,
    BuildContext? context,
    String? formSection,
  }) {
    return CustomeTextFieldState(
      isFocused: isFocused ?? this.isFocused,
      isEmpty: isEmpty ?? this.isEmpty,
      errorMessage: errorMessage ?? this.errorMessage,
      focusNode: focusNode ?? this.focusNode,
      controller: controller ?? this.controller,
      fieldValue: fieldValue ?? this.fieldValue,
      countInit : countInit ?? this.countInit,
      context: context ?? this.context,
      formSection: formSection ?? this.formSection,
    );
  }
}