import 'package:flutter/material.dart';

/// Konfigurasi tema aplikasi - warna, font, dan gaya komponen.
class AppTheme {
  /// Warna utama - hijau tua
  static const Color primaryColor = Color(0xFF01875F);

  /// Warna sekunder - hijau cerah
  static const Color secondaryColor = Color(0xFF34A853);

  /// Warna latar terang
  static const Color _lightScaffoldColor = Color(0xFFF1F3F4);

  /// Warna latar gelap
  static const Color _darkScaffoldColor = Color(0xFF101417);

  /// Warna permukaan gelap
  static const Color _darkSurfaceColor = Color(0xFF181C1F);

  /// Warna input gelap
  static const Color _darkInputFillColor = Color(0xFF1F2427);

  /// Skema warna tema terang
  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
    primary: primaryColor,
    secondary: secondaryColor,
  );

  /// Skema warna tema gelap
  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
    primary: primaryColor,
    secondary: secondaryColor,
  );

  /// Ambil tema terang
  static ThemeData get lightTheme => _buildTheme(_lightColorScheme);

  /// Ambil tema gelap
  static ThemeData get darkTheme => _buildTheme(_darkColorScheme);

  /// Bangun tema berdasarkan ColorScheme
  static ThemeData _buildTheme(ColorScheme colorScheme) {
    /// Cek apakah tema gelap
    final bool isDark = colorScheme.brightness == Brightness.dark;

    /// Warna latar scaffold
    final Color scaffoldColor = isDark
        ? _darkScaffoldColor
        : _lightScaffoldColor;

    /// Warna kartu
    final Color cardColor = isDark ? _darkSurfaceColor : Colors.white;

    /// Warna app bar
    final Color appBarColor = isDark ? _darkSurfaceColor : colorScheme.surface;

    /// Warna input field
    final Color inputFillColor = isDark ? _darkInputFillColor : Colors.white;

    /// Warna teks redup
    final Color mutedTextColor = isDark
        ? Colors.grey.shade400
        : Colors.grey.shade600;

    /// Warna garis pembatas
    final Color dividerColor = isDark
        ? Colors.grey.shade800
        : Colors.grey.shade300;

    /// Warna background chip
    final Color chipBackground = isDark
        ? const Color(0xFF22282B)
        : Colors.grey.shade200;

    /// Warna chip terpilih
    final Color chipSelected = colorScheme.primary.withValues(
      alpha: isDark ? 0.25 : 0.15,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldColor,
      fontFamily: 'Roboto',

      /// Gaya app bar
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),

      /// Gaya kartu
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        surfaceTintColor: cardColor,
      ),

      /// Gaya elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          elevation: 0,
        ),
      ),

      /// Gaya filled button
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      /// Gaya outlined button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),

      /// Gaya text button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),

      /// Gaya input field
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFillColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        hintStyle: TextStyle(color: mutedTextColor),
        labelStyle: const TextStyle(fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: dividerColor, width: 1.2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: dividerColor, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEA4335), width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFEA4335), width: 1.5),
        ),
      ),

      /// Gaya chip
      chipTheme: ChipThemeData(
        backgroundColor: chipBackground,
        selectedColor: chipSelected,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
      ),

      dividerColor: dividerColor,
      splashFactory: InkRipple.splashFactory,
    );
  }
}
