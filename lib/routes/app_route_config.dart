import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:identity/pages/authentication/login/login_page.dart';
import 'package:identity/pages/splash_page.dart';
import 'package:identity/pages/started_page.dart';
import 'package:identity/routes/app_route_constants.dart';

import '../pages/error/error_page.dart';

class MyAppRouter {
  static final GoRouter _router = GoRouter(
      initialLocation: '/splash_page',
      routes: [
        GoRoute(
            path: '/splash_page',
            name: IdentityRouteConstant.splashRouteName,
            pageBuilder: (context, state) {
              return MaterialPage(child: SplashPage());
            }),
        GoRoute(
            path: '/started_page',
            name: IdentityRouteConstant.startedRouteName,
            pageBuilder: (context, state) {
              return MaterialPage(child: StartedPage());
            }),
        GoRoute(
            path: '/login_page',
            name: IdentityRouteConstant.loginRouteName,
            pageBuilder: (context, state) {
              return MaterialPage(child: LoginPage());
            }),

        /* Example when its need params */
        // GoRoute(
        //     path: '/startedpage/:userName',
        //     name: IdentityRouteConstant.startedRouteName,
        //     pageBuilder: (context, state) {
        //       return MaterialPage(child: StartedPage(userName: state.params['userName']!));
        //     }),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(child: ErrorPage());
      });

  static GoRouter get router => _router;
}
