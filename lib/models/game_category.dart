import 'game.dart';

/// Represents a curated group of apps that share the same theme.
class GameCategory {
  /// Unique identifier for the category.
  final String id;

  /// Display title for the category.
  final String title;

  /// Short description that explains the category focus.
  final String subtitle;

  /// Collection of apps that belong to this category.
  final List<Game> games;

  const GameCategory({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.games,
  });
}
