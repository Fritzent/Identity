import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/utils/dashed_border.dart';
import 'package:identity/widgets/custom_button.dart';
import 'package:identity/widgets/custom_progress_bar.dart';

class CvForm extends StatefulWidget {
  const CvForm({super.key});

  @override
  State<CvForm> createState() => _CvFormState();
}

class _CvFormState extends State<CvForm> {
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
            child: LayoutBuilder(builder: (context, constraint) {
              Widget content = Padding(
                padding: EdgeInsets.only(
                  top: kIsWeb ? FontList.font16 : FontList.font32,
                  left: FontList.font24,
                  right: FontList.font24,
                ),
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
                              AppLocalizations.of(context)!.cvText,
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
                              AppLocalizations.of(context)!.cvSubTitle,
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
                                CustomPaint(
                                  painter: DashedBorderPainter(),
                                  child: Container(
                                      width: double.infinity,
                                      height: kIsWeb
                                          ? MediaQuery.of(context).size.height /
                                              2.5
                                          : FontList.font225,
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: FontList.font16,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/image/ic_import_file.svg',
                                            height: FontList.font32,
                                            width: FontList.font38,
                                          ),
                                          Text(
                                            textAlign: TextAlign.start,
                                            AppLocalizations.of(context)!
                                                .importYourFilesText,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(
                                                    fontSize: FontList.font16,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: ColorList
                                                        .generalWhite100AppFonts),
                                          ),
                                        ],
                                      )),
                                ),
                                Gap(FontList.font43),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: FontList.font16,
                                      vertical: FontList.font11),
                                  width: double.infinity,
                                  height: 95,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(FontList.font16),
                                    color: Theme.of(context).primaryColorDark,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(64, 0, 0, 0),
                                        spreadRadius: 0,
                                        blurRadius: 4,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    spacing: FontList.font16,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: FontList.font17,
                                            vertical: FontList.font20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              FontList.font16),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: SvgPicture.asset(
                                          'assets/image/ic_file_uploaded.svg',
                                          height: FontList.font32,
                                          width: FontList.font32,
                                          colorFilter: ColorFilter.mode(
                                              Theme.of(context)
                                                  .primaryColorDark,
                                              BlendMode.srcIn),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          spacing: FontList.font4,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              textAlign: TextAlign.start,
                                              'Fritzent_CV.pdf',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                      fontSize: FontList.font16,
                                                      fontWeight: FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                            ),
                                            Text(
                                              textAlign: TextAlign.start,
                                              '12 Kb',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                      fontSize: FontList.font16,
                                                      fontWeight: FontWeight.bold,
                                                      color: ColorList
                                                          .generalWhite100AppFonts),
                                            ),
                                            CustomProgressBar(progress: 0.8)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Gap(FontList.font15),
                                GestureDetector(
                                  onTap: () {
                                    // if (mounted) {
                                    //   GoRouter.of(context).pushReplacementNamed(
                                    //       IdentityRouteConstant.cvFormName);
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
