import 'package:diary_report_sample/app/app.dart';
import 'package:diary_report_sample/app/flavor.dart';
import 'package:diary_report_sample/firebase_options.dart';
import 'package:diary_report_sample/services/app_preferences_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  GoRouter.optionURLReflectsImperativeAPIs = true;

  const String envFileName = "configs/production.env";
  const Flavor flavorName = Flavor.production;

  await dotenv.load(fileName: envFileName);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.002),
    ),
  );

  await initializeDateFormatting().then(
    (_) => runApp(
      FlavorProvider(
        flavor: flavorName,
        child: ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(prefs),
          ],
          child: const App(),
        ),
      ),
    ),
  );
}
