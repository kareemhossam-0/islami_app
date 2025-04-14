import 'package:flutter/material.dart';

import '../../presentation/splash/splash.dart';

class RoutesManager {
  static const splash = "/splash";


  static Map<String, WidgetBuilder> router = {
    splash: (_) => const Splash(),

  };
}