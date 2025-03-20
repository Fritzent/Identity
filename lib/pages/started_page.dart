import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/bloc/language_data_bloc.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/l10n/l10n.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/routes/app_route_constants.dart';
import 'package:identity/widgets/custom_button.dart';

import '../resources/font_config.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({super.key});

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<LanguageDataBloc, LanguageDataState>(
          builder: (context, state) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: kIsWeb
                    ? (MediaQuery.of(context).size.width / 2 >= 800
                        ? MediaQuery.of(context).size.width * 0.4
                        : MediaQuery.of(context).size.width)
                    : MediaQuery.of(context).size.width,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 48,
                  right: 48,
                  bottom: 64,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                            isExpanded: false,
                            items: L10n.all
                                .map((item) => DropdownMenuItem<String>(
                                      value: item.languageCode,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            alignment: Alignment.topRight,
                                            item.languageCode ==
                                                    L10n.all.first.languageCode
                                                ? 'assets/image/ic_england_flag.svg'
                                                : 'assets/image/ic_indonesia_flag.svg',
                                          ),
                                          Gap(FontList.font6),
                                          Text(
                                            item.languageCode.toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontSize: FontList.font12,
                                                  color: ColorList
                                                      .generalWhiteAppFonts,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                            value: state.locale.languageCode,
                            onChanged: (value) {
                              if (value != null) {
                                context.read<LanguageDataBloc>().add(ChangeLanguage(
                                  Locale(value)
                                ));
                              }
                            },
                            buttonStyleData: ButtonStyleData(
                              padding: const EdgeInsets.only(
                                  top: FontList.font11,
                                  bottom: FontList.font11,
                                  right: FontList.font16),
                              height: FontList.font38,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(FontList.font16),
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                  color: ColorList.darkModeBackground),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: FontList.font100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(FontList.font16),
                                color: ColorList.darkModeBackground,
                              ),
                            ),
                            iconStyleData: IconStyleData(
                              icon: SvgPicture.asset(
                                alignment: Alignment.topRight,
                                'assets/image/ic_drop_down.svg',
                              ),
                            ),
                          )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              alignment: Alignment.topRight,
                              'assets/image/identity_logo.svg',
                              height: FontList.font84,
                              width: FontList.font84,
                            ),
                            Text(
                              AppLocalizations.of(context)!.appName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: FontList.font48,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .welcomeToText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          fontSize: FontList.font16,
                                          fontWeight: FontWeight.normal,
                                          color: ColorList.generalGrayAppFonts),
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!.appName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontSize: FontList.font16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .identityMotto,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          fontSize: FontList.font16,
                                          fontWeight: FontWeight.normal,
                                          color: ColorList.generalGrayAppFonts),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gap(FontList.font40),
                          GestureDetector(
                              onTap: () {
                                print('Hello Button');
                              },
                              child: CustomButton(
                                  textButton: AppLocalizations.of(context)!
                                      .getStarted)),
                          Gap(FontList.font16),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .alreadyHaveAccount,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            ColorList.generalWhite100AppFonts,
                                      ),
                                ),
                                WidgetSpan(
                                  child: ShaderMask(
                                    shaderCallback: (bounds) => LinearGradient(
                                      colors: [
                                        ColorList.generalBlueAppFonts,
                                        ColorList.generalBlue100AppFonts,
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
                                                      .loginRouteName);
                                        }
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.signIn,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
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
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
