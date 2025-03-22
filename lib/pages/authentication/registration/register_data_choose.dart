import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/data/section_data_items.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/routes/app_route_constants.dart';
import 'package:identity/widgets/custom_button.dart';
import 'package:identity/widgets/custom_button_choosen.dart';

class RegisterDataChoose extends StatefulWidget {
  const RegisterDataChoose({super.key});

  @override
  State<RegisterDataChoose> createState() => _RegisterDataChooseState();
}

class _RegisterDataChooseState extends State<RegisterDataChoose> {
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
            child: Padding(
              padding: const EdgeInsets.only(
                top: FontList.font24,
                left: FontList.font24,
                right: FontList.font24,
                bottom: 64,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: FontList.font24),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context)!
                                .registerDataChooseTitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: FontList.font24,
                                ),
                          ),
                          Gap(FontList.font24),
                          Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context)!
                                .registerDataChooseSubTitile,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: FontList.font16,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: GridView.builder(
                            padding: EdgeInsets.only(top: 53),
                            shrinkWrap: true,
                            physics: kIsWeb
                                ? AlwaysScrollableScrollPhysics()
                                : NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: FontList.font24,
                              mainAxisSpacing: FontList.font22,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: sectionItemData.length,
                            itemBuilder: (context, index) {
                              return CustomButtonChoosen(
                                  textButton:
                                      sectionItemData[index].sectionName,
                                  iconPath: sectionItemData[index].iconPath);
                            },
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: FontList.font24),
                    child: GestureDetector(
                      onTap: () {
                        if (mounted) {
                          GoRouter.of(context).pushReplacementNamed(
                              IdentityRouteConstant.bioFormName);
                        }
                      },
                      child: CustomButton(
                          textButton:
                              AppLocalizations.of(context)!.continueText),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
