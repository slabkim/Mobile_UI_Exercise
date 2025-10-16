import 'dart:async';

import 'package:flutter/material.dart';
import '../models/user.dart';
import '../constants/app_constants.dart';

/// Provider untuk mengelola status autentikasi pengguna
class AuthProvider extends ChangeNotifier {
  /// User yang sedang login
  User? _user;

  /// Status loading operasi autentikasi
  bool _isLoading = false;

  /// Pesan error terakhir
  String? _errorMessage;

  /// Ambil user saat ini
  User? get user => _user;

  /// Ambil status loading
  bool get isLoading => _isLoading;

  /// Ambil pesan error
  String? get errorMessage => _errorMessage;

  /// Cek apakah user sudah login
  bool get isAuthenticated => _user != null;

  /// Login dengan email dan password
  /// Mengembalikan true jika berhasil, false jika gagal
  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _setErrorMessage(null);

    /// Simulasi delay jaringan
    await Future.delayed(const Duration(seconds: 2));

    /// Validasi dummy dengan email dan password dummy
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

  /// Register dengan nama, email, password, dan konfirmasi password
  /// Mengembalikan true jika berhasil, false jika gagal
  Future<bool> register(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    _setLoading(true);
    _setErrorMessage(null);

    /// Simulasi delay jaringan
    await Future.delayed(const Duration(seconds: 2));

    /// Validasi password dan confirmPassword harus sama
    if (password != confirmPassword) {
      _setErrorMessage(AppConstants.passwordMismatch);
      _setLoading(false);
      notifyListeners();
      return false;
    }

    /// Cek email tidak boleh email dummy
    if (email == AppConstants.dummyUserEmail) {
      _setErrorMessage(AppConstants.registerFailed);
      _setLoading(false);
      notifyListeners();
      return false;
    }

    /// Registrasi berhasil
    _user = User(name: name, email: email);
    _setLoading(false);
    notifyListeners();
    return true;
  }

  /// Logout user saat ini
  void logout() {
    _user = null;
    notifyListeners();
  }

  /// Set status loading
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  /// Set pesan error
  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }
}
