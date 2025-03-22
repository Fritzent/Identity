import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/widgets/custom_button.dart';
import 'package:identity/widgets/custom_text_field.dart';

class BioForm extends StatefulWidget {
  const BioForm({super.key});

  @override
  State<BioForm> createState() => _BioFormState();
}

class _BioFormState extends State<BioForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: kIsWeb
                  ? (MediaQuery.of(context).size.width / 2 >= 800
                      ? MediaQuery.of(context).size.width * 0.4
                      : MediaQuery.of(context).size.width)
                  : MediaQuery.of(context).size.width,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              Widget content = Padding(
                padding: EdgeInsets.only(
                    top: kIsWeb ? FontList.font16 : FontList.font32,
                    left: FontList.font24,
                    right: FontList.font24,),
                child: Column(
                  spacing: FontList.font29,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              AppLocalizations.of(context)!.biographyText,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: FontList.font24,
                                  ),
                            ),
                            Gap(FontList.font16),
                            Text(
                              textAlign: TextAlign.start,
                              AppLocalizations.of(context)!.biographySubTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: FontList.font32),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              border: BorderDirectional(
                                top: BorderSide(
                                    color: ColorList.generalWhite100AppFonts,
                                    width: 1),
                                start: BorderSide(
                                    color: ColorList.generalWhite100AppFonts,
                                    width: 1),
                                end: BorderSide(
                                    color: ColorList.generalWhite100AppFonts,
                                    width: 1),
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(FontList.font16),
                                  topRight: Radius.circular(FontList.font16)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(64, 0, 0, 0),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(
                                top: FontList.font24,
                                left: FontList.font24,
                                right: FontList.font24,
                                bottom: FontList.font84),
                            child: Column(
                              spacing: FontList.font16,
                              children: [
                                CustomTextField(
                                  textFieldLabel: AppLocalizations.of(context)!
                                      .professionalTitle,
                                  textFieldHint: AppLocalizations.of(context)!
                                      .professionalFieldHint,
                                  keypadType: TextInputType.text,
                                  formSection: AppLocalizations.of(context)!
                                      .professionalTitle,
                                  onChanged: (value) {},
                                ),
                                CustomTextField(
                                  textFieldLabel: AppLocalizations.of(context)!
                                      .tellUsAboutTitle,
                                  textFieldHint: AppLocalizations.of(context)!
                                      .tellUsAboutFieldHint,
                                  keypadType: TextInputType.text,
                                  formSection: AppLocalizations.of(context)!
                                      .tellUsAboutTitle,
                                  onChanged: (value) {},
                                ),
                                CustomTextField(
                                  textFieldLabel: AppLocalizations.of(context)!
                                      .dateOfBirthTitle,
                                  textFieldHint: AppLocalizations.of(context)!
                                      .dateOfBirthFieldHint,
                                  keypadType: TextInputType.text,
                                  formSection: AppLocalizations.of(context)!
                                      .dateOfBirthTitle,
                                  isDateSection : true,
                                  onChanged: (value) {},
                                ),
                                CustomTextField(
                                  textFieldLabel: AppLocalizations.of(context)!
                                      .currentLastJobTitle,
                                  textFieldHint: AppLocalizations.of(context)!
                                      .currentLastJobFieldHint,
                                  keypadType: TextInputType.text,
                                  formSection: AppLocalizations.of(context)!
                                      .currentLastJobTitle,
                                  onChanged: (value) {},
                                ),
                                CustomTextField(
                                  textFieldLabel: AppLocalizations.of(context)!
                                      .lengthOfWorkExperienceTitle,
                                  textFieldHint: AppLocalizations.of(context)!
                                      .lengthOfWorkExperienceFieldHint,
                                  keypadType: TextInputType.number,
                                  formSection: AppLocalizations.of(context)!
                                      .lengthOfWorkExperienceTitle,
                                  inputFormatter: FilteringTextInputFormatter.digitsOnly,
                                  onChanged: (value) {},
                                ),
                                Gap(FontList.font15),
                                GestureDetector(
                                  onTap: () {
                                    // if (mounted) {
                                    //   GoRouter.of(context).pushReplacementNamed(
                                    //       IdentityRouteConstant.bioFormName);
                                    // }
                                  },
                                  child: CustomButton(
                                      textButton: AppLocalizations.of(context)!
                                          .continueText),
                                ),
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              );

              return LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(child: content)));
              });
            })),
      ),
    );
  }
}
