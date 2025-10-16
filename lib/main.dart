import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/app_constants.dart';
import 'constants/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/library_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/splash/splash_screen.dart';

/// Entry point aplikasi PauseStore
void main() {
  runApp(const MyApp());
}

/// Root widget aplikasi dengan konfigurasi provider dan tema
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Setup semua provider yang digunakan di aplikasi
    return MultiProvider(
      providers: [
        /// Provider untuk autentikasi user
        ChangeNotifierProvider(create: (_) => AuthProvider()),

        /// Provider untuk library game user
        ChangeNotifierProvider(create: (_) => LibraryProvider()),

        /// Provider untuk manajemen tema aplikasi
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (_, themeProvider, __) {
          return MaterialApp(
            /// Judul aplikasi
            title: AppConstants.appName,

            /// Sembunyikan debug banner
            debugShowCheckedModeBanner: false,

            /// Tema terang
            theme: AppTheme.lightTheme,

            /// Tema gelap
            darkTheme: AppTheme.darkTheme,

            /// Mode tema dari provider
            themeMode: themeProvider.themeMode,

            /// Halaman awal adalah splash screen
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
