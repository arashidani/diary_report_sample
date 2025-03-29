import 'package:flutter/material.dart';
import 'platform_logout.dart';

class StubPlatformLogout implements PlatformLogout {
  @override
  void logout(BuildContext context) {
    // 何もしない
  }
}

PlatformLogout getPlatformLogout() => StubPlatformLogout();
