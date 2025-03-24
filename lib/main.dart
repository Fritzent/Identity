import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:identity/bloc/language_data_bloc.dart';
import 'package:identity/database/cv.dart';
import 'package:identity/database/language.dart';
import 'package:identity/database/themes.dart';
import 'package:identity/l10n/app_localizations.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:identity/bloc/theme_data_bloc.dart';
import 'package:identity/resources/theme.dart';
import 'package:identity/routes/app_route_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:identity/l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ThemesAdapter());
  Hive.registerAdapter(LanguageAdapter());
  Hive.registerAdapter((CvPdfFileAdapter()));
  await Hive.openBox('themesBox');
  await Hive.openBox('languageBox');
  await Hive.openBox('cvPdfFileBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb) {
    await webRequestLocationPermission();
  } else {
    await requestLocationPermission();
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeDataBloc()..add(AutoThemeEvent()),
        ),
        BlocProvider(
          create: (context) => LanguageDataBloc()..add(LoadLanguage()),
        ),
      ],
      child: const MainApp(),
    ));
  });
}

Future<void> requestLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    await Geolocator.requestPermission();
  }
}

Future<void> webRequestLocationPermission() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    await Geolocator.requestPermission();
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeDataBloc, ThemeDataState>(
      builder: (context, stateTheme) {
        return BlocBuilder<LanguageDataBloc, LanguageDataState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: MyAppRouter.router,
              themeMode: kIsWeb ? ThemeMode.light : stateTheme.themeMode,
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
    );
  }
}
