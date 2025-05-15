import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/resources/colors.dart';
import 'package:identity/resources/font_config.dart';
import 'package:identity/routes/app_route_constants.dart';
import 'package:identity/widgets/custom_button.dart';
import 'package:rive/rive.dart';

class RegisterSuccessPage extends StatefulWidget {
  const RegisterSuccessPage({super.key});

  @override
  State<RegisterSuccessPage> createState() => _RegisterSuccessPageState();
}

class _RegisterSuccessPageState extends State<RegisterSuccessPage> {
  late final RiveAnimationController controller;

  bool isPlaying = false;

  @override
  void dispose() {
    if (controller.isActive) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = OneShotAnimation('Idle', autoplay: true, onStop: () {});
  }

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
                padding: const EdgeInsets.only(
                  top: 24,
                  left: 48,
                  right: 48,
                  bottom: 64,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .registrationSuccessText,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: FontList.font24,
                                  ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.height / 2,
                              height: MediaQuery.of(context).size.height / 2,
                              child: RiveAnimation.asset(
                                'assets/rive_motion/identity_success_registration.riv',
                                fit: BoxFit.cover,
                                onInit: (artboard) {
                                  artboard.addController(controller);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .registrationSuccessSubtitle,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontSize: FontList.font16,
                                    fontWeight: FontWeight.normal,
                                    color: ColorList.generalGrayAppFonts),
                          ),
                          Gap(FontList.font40),
                          GestureDetector(
                              onTap: () {
                                if (mounted) {
                                  GoRouter.of(context).pushReplacementNamed(
                                      IdentityRouteConstant.mainDashboard);
                                }
                              },
                              child: CustomButton(
                                  textButton: AppLocalizations.of(context)!
                                      .continueText)),
                        ],
                      ),
                    ),
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
