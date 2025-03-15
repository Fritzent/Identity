import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/routes/app_route_constants.dart';
import 'package:rive/rive.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SimpleAnimation controller;
  bool isPlaying = false;
  final Key animationKey = ValueKey('splash_animation');

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = SimpleAnimation('Entrence', autoplay: true);

    Future.delayed(const Duration(milliseconds: 2800), () {
      if (mounted) {
        GoRouter.of(context).goNamed(IdentityRouteConstant.startedRouteName);
      }
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
              Theme.of(context).brightness == Brightness.dark
                  ? 'assets/rive_motion/identity_dark_mode_splash.riv'
                  : 'assets/rive_motion/identity_light_mode_splash.riv',
              fit: BoxFit.contain,
              key: animationKey,
              onInit: (artboard) {
                artboard.addController(controller);
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '@2025 Fritzent All rights reserved',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
