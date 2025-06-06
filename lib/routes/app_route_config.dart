import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:identity/pages/authentication/login/login_page.dart';
import 'package:identity/pages/authentication/registration/preparation/bio_form.dart';
import 'package:identity/pages/authentication/registration/preparation/cv_form.dart';
import 'package:identity/pages/authentication/registration/preparation/link_url_form.dart';
import 'package:identity/pages/authentication/registration/register_data_choose.dart';
import 'package:identity/pages/authentication/registration/register_page.dart';
import 'package:identity/pages/authentication/registration/register_success_page.dart';
import 'package:identity/pages/dashboard/main_dashboard.dart';
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
          },
          redirect: (context, state) async {
            final userBox = Hive.box('userBox');
            if (userBox.isNotEmpty && state.matchedLocation == '/started_page') {
              return '/main_dashboard_page';
            }
            return null;
          },
        ),
        GoRoute(
            path: '/login_page',
            name: IdentityRouteConstant.loginRouteName,
            pageBuilder: (context, state) {
              return MaterialPage(child: LoginPage());
            }),
        GoRoute(
            path: '/register_page',
            name: IdentityRouteConstant.registerRouteName,
            pageBuilder: (context, state) {
              return MaterialPage(child: RegisterPage());
            }),
        GoRoute(
          path: '/register_data_choose_page',
          name: IdentityRouteConstant.registerDataChoose,
          pageBuilder: (context, state) {
            return MaterialPage(child: RegisterDataChoose());
          },
        ),
        GoRoute(
          path: '/bio_form_page',
          name: IdentityRouteConstant.bioFormName,
          pageBuilder: (context, state) {
            return MaterialPage(child: BioForm());
          },
        ),
        GoRoute(
          path: '/cv_form_page',
          name: IdentityRouteConstant.cvFormName,
          pageBuilder: (context, state) {
            return MaterialPage(child: CvForm());
          },
        ),
        GoRoute(
          path: '/url_form_page',
          name: IdentityRouteConstant.urlFormName,
          pageBuilder: (context, state) {
            return MaterialPage(child: LinkUrlForm());
          },
        ),
        GoRoute(
          path: '/registration_success_page',
          name: IdentityRouteConstant.registrationSuccessName,
          pageBuilder: (context, state) {
            return MaterialPage(child: RegisterSuccessPage());
          },
        ),
        GoRoute(
          path: '/main_dashboard_page',
          name: IdentityRouteConstant.mainDashboard,
          pageBuilder: (context, state) {
            return MaterialPage(child: MainDashboard());
          },
        ),

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
