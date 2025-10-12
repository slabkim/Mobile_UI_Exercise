import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/app_constants.dart';
import 'constants/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/library_provider.dart';
import 'screens/splash/splash_screen.dart';

/// Main entry point of the application.
void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
/// Sets up providers and initial route.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LibraryProvider()),
      ],
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}
