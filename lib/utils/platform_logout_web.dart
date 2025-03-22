import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

import 'platform_logout.dart';

class WebPlatformLogout implements PlatformLogout {
  @override
  void logout(BuildContext context) {
    html.window.location.reload();
  }
}

PlatformLogout getPlatformLogout() => WebPlatformLogout();
