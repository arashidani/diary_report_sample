import 'dart:io';

import 'package:diary_report_sample/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:diary_report_sample/app.dart';
import 'package:diary_report_sample/core/config/firebase_options.dart';

import '2_application/config/flavor.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String envFileName = "configs/develop.env";
  const Flavor flavorName = Flavor.develop;

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
          child: Platform.isIOS
              ? const CupertinoAppWrapper()
              : const MaterialAppWrapper(),
        ),
      ),
    ),
  );
}
