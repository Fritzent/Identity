import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:identity/app/app_entry.dart';
import 'package:identity/app/app_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await AppInitializer.initialize();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const AppEntry()));
}
