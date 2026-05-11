import 'package:flutter/material.dart';
import 'ui/app/app_theme.dart';
import 'ui/app/app_router.dart';

class EverEngineApp extends StatelessWidget {
  const EverEngineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EverEngine',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      onGenerateRoute: AppRouter.router.generateRoute,
      initialRoute: '/',
    );
  }
}
