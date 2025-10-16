import 'game.dart';

/// Model kategori game dengan judul dan daftar game
class GameCategory {
  /// ID unik kategori
  final String id;

  /// Judul kategori
  final String title;

  /// Deskripsi singkat kategori
  final String subtitle;

  /// Daftar game dalam kategori
  final List<Game> games;

  const GameCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.games,
  });
}
