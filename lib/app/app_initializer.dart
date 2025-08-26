import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:identity/firebase_options.dart';
import 'package:identity/services/permission_service.dart' as permission_service;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:identity/database/themes.dart';
import 'package:identity/database/language.dart';
import 'package:identity/database/cv.dart';
import 'package:identity/database/user.dart';
import 'package:identity/database/data_stepper.dart';

class AppInitializer {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ThemesAdapter());
    Hive.registerAdapter(LanguageAdapter());
    Hive.registerAdapter(CvPdfFileAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(DataStepperAdapter());
    await Hive.openBox('themesBox');
    await Hive.openBox('languageBox');
    await Hive.openBox('cvPdfFileBox');
    await Hive.openBox('userBox');
    await Hive.openBox('dataStepperBox');
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'].toString(),
      anonKey: dotenv.env['SUPABASE_KEY'].toString(),
    );
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    
    await permission_service.PermissionService.ensureLocationPermission();
  }
}