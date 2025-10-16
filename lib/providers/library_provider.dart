import 'package:flutter/material.dart';
import '../models/game.dart';
// import '../constants/app_constants.dart';

/// Provider untuk mengelola library game pengguna
class LibraryProvider extends ChangeNotifier {
  /// Daftar game di library
  final List<Game> _libraryGames = [];

  /// Ambil daftar game di library (tidak bisa diubah)
  List<Game> get libraryGames => List.unmodifiable(_libraryGames);

  /// Tambah game ke library
  void addGame(Game game) {
    if (!_libraryGames.contains(game)) {
      _libraryGames.add(game);
      notifyListeners();
    }
  }

  /// Hapus game dari library
  void removeGame(Game game) {
    _libraryGames.remove(game);
    notifyListeners();
  }

  /// Cek apakah game sudah ada di library
  bool isInLibrary(Game game) {
    return _libraryGames.contains(game);
  }

  /// Hapus semua game di library
  void clearLibrary() {
    _libraryGames.clear();
    notifyListeners();
  }
}
