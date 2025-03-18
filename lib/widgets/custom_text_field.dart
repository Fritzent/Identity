import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:identity/bloc/custome_text_field_bloc.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';

class CustomTextField extends StatefulWidget {
  final String textFieldLabel;
  final String textFieldHint;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keypadType;
  final String? textFieldErrorLabel;
  final bool isError;
  final String formSection;
  final bool hasRightIcon;
  final String? rightIconPath;
  final bool hasLeftIcon;
  final String? leftIconPath;

  const CustomTextField(
      {super.key,
      required this.textFieldLabel,
      required this.textFieldHint,
      this.onChanged,
      this.validator,
      required this.keypadType,
      this.textFieldErrorLabel,
      this.isError = false,
      required this.formSection,
      this.hasRightIcon = false,
      this.rightIconPath,
      this.hasLeftIcon = false,
      this.leftIconPath});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFocused = false;
  bool isEmpty = true;
  bool isListenerAdded = false;
  bool isFocusListenerAdded = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomeTextFieldBloc(),
      child: BlocBuilder<CustomeTextFieldBloc, CustomeTextFieldState>(
          builder: (context, state) {
        var bloc = context.read<CustomeTextFieldBloc>();

        if (state.focusNode != null && !isFocusListenerAdded) {
          isFocusListenerAdded = true;
          state.focusNode?.addListener(() {
            bloc.add(OnFocusChange(state.focusNode!.hasFocus));
          });
        }

        if (state.controller != null &&
            !isListenerAdded &&
            state.focusNode!.hasFocus) {
          isListenerAdded = true;
          state.controller?.addListener(() {
            bloc.add(OnTextChange(
                state.controller!.text.isEmpty, state.controller!.text));
          });
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: FontList.font12,
          children: [
            Text(
              widget.textFieldLabel,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: FontList.font16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                state.focusNode!.requestFocus();
              },
              child: TextFormField(
                  keyboardType: widget.keypadType,
                  focusNode: state.focusNode,
                  controller: state.controller,
                  onChanged: widget.onChanged,
                  validator: widget.validator,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: FontList.font16,
                        fontWeight: FontWeight.normal,
                      ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      top: FontList.font7,
                      bottom: FontList.font7,
                      left: FontList.font24,
                      right: FontList.font12,
                    ),
                    prefixIcon: widget.hasLeftIcon
                        ? Container(
                            padding: EdgeInsets.all(kIsWeb ? FontList.font10 : FontList.font14),
                            constraints: BoxConstraints(
                              maxWidth: FontList.font4,
                              maxHeight: FontList.font4,
                            ),
                            child: SvgPicture.asset(
                              widget.leftIconPath.toString(),
                              fit: BoxFit.contain,
                            ),
                          )
                        : null,
                    suffixIcon: widget.hasRightIcon
                        ? Container(
                            padding: EdgeInsets.all(kIsWeb ? FontList.font10 : FontList.font14),
                            constraints: BoxConstraints(
                              maxWidth: FontList.font4,
                              maxHeight: FontList.font4,
                            ),
                            child: SvgPicture.asset(
                              widget.rightIconPath.toString(),
                              fit: BoxFit.contain,
                            ),
                          )
                        : null,
                    hintText: widget.textFieldHint,
                    hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: FontList.font16,
                        fontWeight: FontWeight.normal,
                        color: ColorList.generalWhite100AppFonts),
                    errorStyle: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                            fontSize: FontList.font16,
                            fontWeight: FontWeight.normal,
                            color: ColorList.redColor),
                    filled: true,
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(FontList.font8),
                      borderSide: BorderSide(
                        color: state.isFocused
                            ? ColorList.greenColor
                            : ColorList.generalWhite100AppFonts,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(FontList.font8),
                      borderSide: BorderSide(
                        color: ColorList.greenColor,
                        width: 1.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(FontList.font8),
                      borderSide: BorderSide(
                        color: ColorList.redColor,
                        width: 1.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(FontList.font8),
                      borderSide: BorderSide(
                        color: ColorList.redColor,
                        width: 1.0,
                      ),
                    ),
                    errorText: state.errorMessage.isNotEmpty
                        ? state.errorMessage
                        : null,
                  )),
            )
          ],
        );
      }),
    );
  }
}
