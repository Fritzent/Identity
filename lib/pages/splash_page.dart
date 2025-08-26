import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:identity/routes/app_route_constants.dart';
import 'package:identity/services/theme_service.dart';
import 'package:rive/rive.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final RiveAnimationController controller;

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
    controller = OneShotAnimation('Entrence', autoplay: true, onStop: () {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          GoRouter.of(context).goNamed(IdentityRouteConstant.startedRouteName);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Stack(children: [
            RiveAnimation.asset(
              ThemeService.getThemeMode(context)
                  ? 'assets/rive_motion/identity_dark_mode_splash.riv'
                  : 'assets/rive_motion/identity_light_mode_splash.riv',
              fit: BoxFit.contain,
              onInit: (artboard) {
                artboard.addController(controller);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                AppLocalizations.of(context)!.allReserved,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
