import 'package:diary_report_sample/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'platform_logout.dart';

class IOPlatformLogout implements PlatformLogout {
  @override
  void logout(BuildContext context) {
    context.replace(Routes.login);
  }
}

PlatformLogout getPlatformLogout() => IOPlatformLogout();
