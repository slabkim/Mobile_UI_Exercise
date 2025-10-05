import 'package:flutter/material.dart';
import '../models/game.dart';
// import '../constants/app_constants.dart';

/// Penyedia untuk mengelola library game pengguna.
/// Menangani penambahan, penghapusan game, dan menyediakan daftar game terkini di library.
class LibraryProvider extends ChangeNotifier {
  final List<Game> _libraryGames = [];

  /// Mengembalikan daftar permainan yang tidak dapat diubah di library pengguna.
  List<Game> get libraryGames => List.unmodifiable(_libraryGames);

  /// Menambahkan permainan ke library jika belum ditambahkan.
  void addGame(Game game) {
    if (!_libraryGames.contains(game)) {
      _libraryGames.add(game);
      notifyListeners();
    }
  }

  /// Menghapus permainan dari library.
  void removeGame(Game game) {
    _libraryGames.remove(game);
    notifyListeners();
  }

  /// Memeriksa apakah suatu permainan sudah ada di library.
  bool isInLibrary(Game game) {
    return _libraryGames.contains(game);
  }

  /// Menghapus seluruh library.
  void clearLibrary() {
    _libraryGames.clear();
    notifyListeners();
  }
}
