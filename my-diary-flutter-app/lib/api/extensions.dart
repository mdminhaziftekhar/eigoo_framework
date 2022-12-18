import 'dart:io';

import 'package:flutter/foundation.dart';

extension StringX on Object {
  void get log {
    // ignore: avoid_print
    if (!kReleaseMode) print(this);
  }
}

extension PlatformX on Platform {
  static bool get isMobile =>
      !kIsWeb ? Platform.isAndroid || Platform.isIOS : false;
  static bool get isDesktop => !kIsWeb
      ? Platform.isLinux || Platform.isMacOS || Platform.isWindows
      : false;
  static bool get isApple =>
      !kIsWeb ? Platform.isMacOS || Platform.isIOS : false;
}
