part of 'custom_multiple_text_field_bloc.dart';

class CustomMultipleTextFieldState {
  final List<bool> isFocusedList;
  final List<bool> isEmptyList;
  final List<String> errorMessageList;
  final List<String> fieldValueList;
  final List<String> formSectionList;
  final List<FocusNode>? focusNodeList;
  final List<TextEditingController>? controllerList;
  final List<int> countInitList;
  final BuildContext? context;
  final List<bool> obscureTextList;

  CustomMultipleTextFieldState({
    this.isFocusedList = const [],
    this.isEmptyList = const [],
    this.errorMessageList = const [],
    List<FocusNode>? focusNodeList,
    List<TextEditingController>? controllerList,
    this.fieldValueList = const [],
    this.countInitList = const [],
    this.context,
    this.formSectionList = const [],
    this.obscureTextList = const [],
  })  : controllerList = controllerList ?? [],
        focusNodeList = focusNodeList ?? [];

  CustomMultipleTextFieldState copyWith({
    List<bool>? isFocusedList,
    List<bool>? isEmptyList,
    List<String>? errorMessageList,
    List<String>? fieldValueList,
    List<String>? formSectionList,
    List<FocusNode>? focusNodeList,
    List<TextEditingController>? controllerList,
    List<int>? countInitList,
    BuildContext? context,
    List<bool>? obscureTextList,
  }) {
    return CustomMultipleTextFieldState(
      isFocusedList: isFocusedList ?? this.isFocusedList,
      isEmptyList: isEmptyList ?? this.isEmptyList,
      errorMessageList: errorMessageList ?? this.errorMessageList,
      focusNodeList: focusNodeList ?? this.focusNodeList,
      controllerList: controllerList ?? this.controllerList,
      fieldValueList: fieldValueList ?? this.fieldValueList,
      countInitList: countInitList ?? this.countInitList,
      context: context ?? this.context,
      formSectionList: formSectionList ?? this.formSectionList,
      obscureTextList: obscureTextList ?? this.obscureTextList,
    );
  }
}
