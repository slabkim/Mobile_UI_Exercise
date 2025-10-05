import 'dart:async';

import 'package:flutter/material.dart';
import '../models/user.dart';
import '../constants/app_constants.dart';

/// Penyedia untuk mengelola status autentikasi.
/// Menangani proses masuk, pendaftaran, status pemuatan, pesan kesalahan, dan pengguna saat ini.
class AuthProvider extends ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  /// Mengembalikan pengguna yang saat ini diautentikasi, atau null jika tidak masuk.
  User? get user => _user;

  /// Mengembalikan apakah operasi autentikasi sedang berlangsung.
  bool get isLoading => _isLoading;

  /// Mengembalikan pesan kesalahan terakhir, atau null jika tidak ada.
  String? get errorMessage => _errorMessage;

  /// Mengembalikan apakah pengguna diautentikasi.
  bool get isAuthenticated => _user != null;

  /// Simulasikan proses masuk dengan email dan kata sandi.
  /// Mengembalikan true jika masuk berhasil, false jika tidak.
  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _setErrorMessage(null);

    // Simulasikan delay jaringan
    await Future.delayed(const Duration(seconds: 2));

    // Validasi dummy: terima jika email cocok dengan email pengguna dummy dan kata sandi cocok dengan kata sandi dummy
    if (email == AppConstants.dummyUserEmail &&
        password == AppConstants.dummyPassword) {
      _user = User(name: AppConstants.dummyUserName, email: email);
      _setLoading(false);
      notifyListeners();
      return true;
    } else {
      _setErrorMessage(AppConstants.loginFailed);
      _setLoading(false);
      notifyListeners();
      return false;
    }
  }

  /// Simulasikan proses registrasi dengan nama, email, kata sandi, dan konfirmasi kata sandi.
  /// Mengembalikan true jika registrasi berhasil, false jika tidak.
  Future<bool> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    _setLoading(true);
    _setErrorMessage(null);

    // Simulasikan penundaan jaringan
    await Future.delayed(const Duration(seconds: 2));

    // Validasi dummy: kata sandi dan confirmPassword harus cocok, email tidak boleh berupa email pengguna dummy
    if (password != confirmPassword) {
      _setErrorMessage(AppConstants.passwordMismatch);
      _setLoading(false);
      notifyListeners();
      return false;
    }

    if (email == AppConstants.dummyUserEmail) {
      _setErrorMessage(AppConstants.registerFailed);
      _setLoading(false);
      notifyListeners();
      return false;
    }

    // Simulasikan pendaftaran yang berhasil
    _user = User(name: name, email: email);
    _setLoading(false);
    notifyListeners();
    return true;
  }

  /// Keluar dari pengguna saat ini.
  void logout() {
    _user = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
