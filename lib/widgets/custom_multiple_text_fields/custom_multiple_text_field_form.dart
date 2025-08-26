import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/widgets/custom_multiple_text_fields/custom_multiple_text_field_bloc.dart';
import 'package:intl/intl.dart';

class CustomMultipleTextFieldForm extends StatefulWidget {
  final int numberOfGeneratedFields;
  final String parentTitleSection;
  final List<String> listOfTextFieldLabels;
  final List<String> listOfTextFieldHints;
  final Function(int index, String value)? listOnChanged;
  final List<String>? Function(int index, String? value)? listValidators;
  final List<TextInputType> listOfKeypadTypes;
  final List<String>? listOfTextFieldErrorLabels;
  final List<bool> listOfIsErrorStates;
  final List<String> listofExternalErrorMessages;
  final List<String> listOfFormSections;
  final List<bool> listOfHasRightIcons;
  final List<String>? listOfRightIconPaths;
  final List<bool> listOfHasLeftIcons;
  final List<String>? listOfLeftIconPaths;
  final List<bool> listOfObscureTexts;
  final List<TextInputFormatter>? listOfInputFormatters;

  const CustomMultipleTextFieldForm(
      {super.key,
      required this.numberOfGeneratedFields,
      required this.parentTitleSection,
      required this.listOfTextFieldLabels,
      required this.listOfTextFieldHints,
      this.listOnChanged,
      this.listValidators,
      required this.listOfKeypadTypes,
      this.listOfTextFieldErrorLabels,
      this.listOfIsErrorStates = const [],
      this.listofExternalErrorMessages = const [],
      required this.listOfFormSections,
      this.listOfHasRightIcons = const [],
      this.listOfRightIconPaths,
      this.listOfHasLeftIcons = const [],
      this.listOfLeftIconPaths,
      this.listOfObscureTexts = const [],
      this.listOfInputFormatters});

  @override
  State<CustomMultipleTextFieldForm> createState() =>
      _CustomMultipleTextFieldFormState();
}

class _CustomMultipleTextFieldFormState
    extends State<CustomMultipleTextFieldForm> {
  final List<bool> listOfIsFocused = [];
  final List<bool> listOfIsEmpty = [];
  final List<bool> listOfIsListenerAdded = [];
  final List<bool> listOfIsFocusListenerAdded = [];
  bool _isInitEventDispatched = false;

  @override
  void initState() {
    for (int i = 0; i < widget.numberOfGeneratedFields; i++) {
      listOfIsFocused.add(false);
      listOfIsEmpty.add(true);
      listOfIsListenerAdded.add(false);
      listOfIsFocusListenerAdded.add(false);
    }
    super.initState();
  }

  @override
  void dispose() {
    listOfIsFocused.clear();
    listOfIsEmpty.clear();
    listOfIsListenerAdded.clear();
    listOfIsFocusListenerAdded.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomMultipleTextFieldBloc(),
      child: BlocBuilder<CustomMultipleTextFieldBloc,
          CustomMultipleTextFieldState>(builder: (context, state) {
        var bloc = context.read<CustomMultipleTextFieldBloc>();

        if (!_isInitEventDispatched) {
          bloc.add(OnInit(widget.numberOfGeneratedFields));
          _isInitEventDispatched = true;
        }

        if (state.focusNodeList!.isEmpty || state.controllerList!.isEmpty) {
          return const SizedBox.shrink();
        }

        if (state.focusNodeList != null &&
            listOfIsFocusListenerAdded.isNotEmpty) {
          for (int i = 0; i < widget.numberOfGeneratedFields; i++) {
            if (!listOfIsFocusListenerAdded[i]) {
              state.focusNodeList?[i].addListener(() {
                bloc.add(
                    OnFocusChangeMultiple(i, state.focusNodeList![i].hasFocus));
              });
              listOfIsFocusListenerAdded[i] = true;
            }
          }
        }

        if (state.controllerList != null && listOfIsListenerAdded.isNotEmpty) {
          for (int i = 0; i < widget.numberOfGeneratedFields; i++) {
            if (!listOfIsListenerAdded[i] && state.focusNodeList![i].hasFocus) {
              state.controllerList?[i].addListener(() {
                bloc.add(OnTextChangeMultiple(
                    i,
                    state.controllerList![i].text.isEmpty,
                    state.controllerList![i].text,
                    context,
                    widget.listOfFormSections[i]));
                if (widget.listOnChanged != null) {
                  widget.listOnChanged!(i, state.controllerList![i].text);
                }
              });
              listOfIsListenerAdded[i] = true;
            }
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.parentTitleSection,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: FontList.font16, fontWeight: FontWeight.bold),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(widget.numberOfGeneratedFields, (i) {
                  final label = widget.listOfTextFieldLabels[i];
                  final hint = widget.listOfTextFieldHints[i];
                  final error = widget.listofExternalErrorMessages[i];
                  final isDate = widget.listOfFormSections[i]
                      .toLowerCase()
                      .contains('date');

                  final hasLeftIcon = widget.listOfHasLeftIcons[i];
                  final leftIconPath = hasLeftIcon
                      ? widget.listOfLeftIconPaths != null &&
                              widget.listOfLeftIconPaths!.isNotEmpty
                          ? widget.listOfLeftIconPaths![i]
                          : null
                      : null;

                  final hasRightIcon = widget.listOfHasRightIcons[i];
                  final rightIconPath = hasRightIcon
                      ? widget.listOfRightIconPaths != null &&
                              widget.listOfRightIconPaths!.isNotEmpty
                          ? widget.listOfRightIconPaths![i]
                          : null
                      : null;
                  final obscureText = widget.listOfObscureTexts[i];
                  final inputFormatter = widget.listOfInputFormatters != null
                      ? widget.listOfInputFormatters![i]
                      : null;
                  final controller = state.controllerList?[i];
                  final focusNode = state.focusNodeList?[i];

                  return Padding(
                    padding: const EdgeInsets.all(FontList.font12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (label.isNotEmpty)
                          Text(
                            label,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontSize: FontList.font16,
                                    fontWeight: FontWeight.bold),
                          ),
                        const SizedBox(height: 4),
                        if (isDate)
                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                helpText: hint,
                                cancelText:
                                    AppLocalizations.of(context)!.closeText,
                                confirmText:
                                    AppLocalizations.of(context)!.chooseText,
                                fieldLabelText: label,
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat("yyyy-MM-dd").format(pickedDate);
                                controller?.text = formattedDate;
                                if (widget.listOnChanged != null) {
                                  widget.listOnChanged!(i, formattedDate);
                                }
                              }
                            },
                            child: AbsorbPointer(
                              child: _buildTextField(
                                context: context,
                                controller: controller,
                                focusNode: focusNode,
                                label: label,
                                hint: hint,
                                error: error,
                                hasLeftIcon: hasLeftIcon,
                                leftIconPath: leftIconPath,
                                hasRightIcon: hasRightIcon,
                                rightIconPath: rightIconPath,
                                obscureText: obscureText,
                                inputFormatter: inputFormatter,
                                isDate: true,
                                onChanged: (val) {
                                  if (widget.listOnChanged != null) {
                                    widget.listOnChanged!(i, val);
                                  }
                                },
                              ),
                            ),
                          )
                        else
                          _buildTextField(
                            context: context,
                            controller: controller,
                            focusNode: focusNode,
                            label: label,
                            hint: hint,
                            error: error,
                            hasLeftIcon: hasLeftIcon,
                            leftIconPath: leftIconPath,
                            hasRightIcon: hasRightIcon,
                            rightIconPath: rightIconPath,
                            obscureText: obscureText,
                            inputFormatter: inputFormatter,
                            isDate: false,
                            onChanged: (val) {
                              if (widget.listOnChanged != null) {
                                widget.listOnChanged!(i, val);
                              }
                            },
                          ),
                      ],
                    ),
                  );
                })),
          ],
        );
      }),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    TextEditingController? controller,
    FocusNode? focusNode,
    required String label,
    required String hint,
    required String error,
    required bool hasLeftIcon,
    String? leftIconPath,
    required bool hasRightIcon,
    String? rightIconPath,
    required bool obscureText,
    TextInputFormatter? inputFormatter,
    required bool isDate,
    required ValueChanged<String> onChanged,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      keyboardType: isDate ? TextInputType.datetime : TextInputType.text,
      inputFormatters: inputFormatter != null ? [inputFormatter] : [],
      obscureText: obscureText,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: FontList.font16,
            fontWeight: FontWeight.normal,
          ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: FontList.font7,
          horizontal: FontList.font24,
        ),
        prefixIcon: hasLeftIcon && leftIconPath != null
            ? Padding(
                padding: const EdgeInsets.all(FontList.font10),
                child: Image.asset(leftIconPath, fit: BoxFit.contain),
              )
            : null,
        suffixIcon: hasRightIcon && rightIconPath != null
            ? Padding(
                padding: const EdgeInsets.all(FontList.font10),
                child: Image.asset(rightIconPath, fit: BoxFit.contain),
              )
            : null,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: FontList.font16,
              fontWeight: FontWeight.normal,
              color: ColorList.generalWhite100AppFonts,
            ),
        errorStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: FontList.font16,
              fontWeight: FontWeight.normal,
              color: ColorList.redColor,
            ),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FontList.font8),
          borderSide: const BorderSide(
            color: ColorList.generalWhite100AppFonts,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FontList.font8),
          borderSide: const BorderSide(
            color: ColorList.greenColor,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FontList.font8),
          borderSide: const BorderSide(
            color: ColorList.redColor,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(FontList.font8),
          borderSide: const BorderSide(
            color: ColorList.redColor,
            width: 1.0,
          ),
        ),
        errorText: error.isNotEmpty ? error : null,
      ),
      readOnly: isDate,
    );
  }
}
