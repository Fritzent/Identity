import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:identity/bloc/theme_data_bloc.dart';
import 'package:identity/resources/theme.dart';
import 'package:identity/routes/app_route_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestLocationPermission();

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


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeDataBloc, ThemeDataState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: MyAppRouter.router,
          themeMode: state.themeMode,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
        );
      },
    );
  }
}
