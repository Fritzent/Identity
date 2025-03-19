import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/routes/app_route_constants.dart';
import 'package:identity/widgets/custom_border_button.dart';
import 'package:identity/widgets/custom_button.dart';
import 'package:identity/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                bool isSmallScreen = constraints.maxHeight < 700;

                Widget content = Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: FontList.font24,
                    vertical: FontList.font64,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.signIn,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: FontList.font32,
                                      ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.signInSubTitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: FontList.font20,
                                      ),
                                ),
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Gap(FontList.font8),
                                Column(
                                  spacing: FontList.font16,
                                  children: [
                                    CustomTextField(
                                      textFieldLabel:
                                          AppLocalizations.of(context)!
                                              .emailText,
                                      textFieldHint:
                                          AppLocalizations.of(context)!
                                              .inputEmailHintText,
                                      keypadType: TextInputType.text,
                                      formSection: AppLocalizations.of(context)!
                                          .emailText,
                                      onChanged: (value) {},
                                    ),
                                    CustomTextField(
                                      textFieldLabel:
                                          AppLocalizations.of(context)!
                                              .passwordText,
                                      textFieldHint:
                                          AppLocalizations.of(context)!
                                              .passwordHintText,
                                      keypadType: TextInputType.text,
                                      formSection: AppLocalizations.of(context)!
                                          .passwordText,
                                      hasRightIcon: true,
                                      rightIconPath:
                                          'assets/image/ic_hide_password.svg',
                                      onChanged: (value) {},
                                    ),
                                    Gap(FontList.font16),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: FontList.font24),
                                      child: GestureDetector(
                                          onTap: () {
                                            print('Hello Button SignIn');
                                          },
                                          child: CustomButton(
                                              textButton:
                                                  AppLocalizations.of(context)!
                                                      .signIn)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: FontList.font24),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: kIsWeb
                                                ? (MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2 >=
                                                        1000
                                                    ? 2
                                                    : 3)
                                                : 1,
                                            child: Container(
                                              height: 1,
                                              decoration: BoxDecoration(
                                                  color: ColorList
                                                      .generalWhite100AppFonts),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              AppLocalizations.of(context)!
                                                  .continueWithText,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: ColorList
                                                          .generalWhite100AppFonts),
                                            ),
                                          ),
                                          Expanded(
                                            flex: kIsWeb
                                                ? (MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2 >=
                                                        1000
                                                    ? 2
                                                    : 3)
                                                : 1,
                                            child: Container(
                                              height: 1,
                                              decoration: BoxDecoration(
                                                  color: ColorList
                                                      .generalWhite100AppFonts),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: FontList.font24),
                                      child: GestureDetector(
                                          onTap: () {
                                            print('Hello Button SignIn');
                                          },
                                          child: CustomBorderButton(
                                            textButton:
                                                AppLocalizations.of(context)!
                                                    .google,
                                            hasLogo: true,
                                            logoPath:
                                                'assets/image/ic_google_logo.svg',
                                          )),
                                    ),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        children: [
                                          TextSpan(
                                            text: AppLocalizations.of(context)!
                                                .dontHaveAccount,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorList
                                                      .generalWhite100AppFonts,
                                                ),
                                          ),
                                          WidgetSpan(
                                            child: ShaderMask(
                                              shaderCallback: (bounds) =>
                                                  LinearGradient(
                                                colors: [
                                                  ColorList.generalBlueAppFonts,
                                                  ColorList
                                                      .generalBlue100AppFonts,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ).createShader(bounds),
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (mounted) {
                                                    GoRouter.of(context)
                                                        .pushReplacementNamed(
                                                            IdentityRouteConstant
                                                                .registerRouteName);
                                                  }
                                                },
                                                child: Text(
                                                  AppLocalizations.of(context)!
                                                      .signUp,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                );

                return isSmallScreen
                    ? LayoutBuilder(builder: (context, constraints) {
                        return SingleChildScrollView(
                            child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight,
                                ),
                                child: IntrinsicHeight(child: content)));
                      })
                    : content;
              }))),
    );
  }
}
