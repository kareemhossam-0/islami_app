
import 'package:flutter/material.dart';
import 'config/theme/theme_manager.dart';
import 'core/routes/routes_manger.dart';

void main() {

  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.router,
      initialRoute: RoutesManager.splash,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.light,
    );
  }
}