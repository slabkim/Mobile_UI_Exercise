import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../auth/login_page.dart';

/// Halaman splash screen yang ditampilkan saat aplikasi dimulai
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// Timer untuk navigasi ke halaman login setelah delay
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    /// Navigasi ke login page setelah 2 detik
    _timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
    });
  }

  @override
  void dispose() {
    /// Batalkan timer saat widget dispose
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /// Background putih simple
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Logo aplikasi dengan ikon
                const Icon(
                  Icons.play_circle_fill_rounded,
                  size: 80,
                  color: Colors.black87,
                ),
                const SizedBox(height: 32),

                /// Judul aplikasi
                Text(
                  AppConstants.splashHeadline,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                /// Subtitle aplikasi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    AppConstants.splashSubtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                /// Loading progress bar
                SizedBox(
                  width: 120,
                  child: LinearProgressIndicator(
                    color: Colors.black87,
                    backgroundColor: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 16),

                /// Teks loading
                Text(
                  'Mengoptimalkan pengalamanmu...',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
      ),

      /// Footer dengan branding
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          'Powered by PauseStore',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}
