import 'package:diary_report_sample/app.dart';
import 'package:diary_report_sample/features/app/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // riverpodを使用するため ProviderScopeでラップ
  const scope = ProviderScope(child: MyApp());
  runApp(scope);
}
