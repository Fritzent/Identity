import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:identity/bloc/theme_data_bloc.dart';
import 'package:identity/pages/started/language_data_bloc.dart';
import 'package:identity/resources/theme.dart';
import 'package:identity/routes/app_route_config.dart';
import 'package:flutter/foundation.dart';
import 'package:identity/l10n/l10n.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeDataBloc()..add(AutoThemeEvent())),
        BlocProvider(create: (_) => LanguageDataBloc()..add(LoadLanguage())),
      ],
      child: BlocBuilder<ThemeDataBloc, ThemeDataState>(
        builder: (context, stateTheme) {
          return BlocBuilder<LanguageDataBloc, LanguageDataState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                routerConfig: MyAppRouter.router,
                themeMode: kIsWeb ? ThemeMode.dark : stateTheme.themeMode,
                theme: AppTheme.lightMode,
                darkTheme: AppTheme.darkMode,
                supportedLocales: L10n.all,
                locale: state.locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
              );
            },
          );
        },
      ),
    );
  }
}