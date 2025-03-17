import 'package:firebase_core/firebase_core.dart';
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
    runApp(BlocProvider(
      create: (context) => ThemeDataBloc()..add(AutoThemeEvent()),
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
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: MyAppRouter.router,
          themeMode: kIsWeb ? ThemeMode.dark : state.themeMode,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          supportedLocales: L10n.all,
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
