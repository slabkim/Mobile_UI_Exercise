/// Kelas model yang merepresentasikan game dalam aplikasi.
/// Berisi semua informasi penting tentang game, termasuk judul, deskripsi, genre, dll.
class Game {
  /// The unique identifier for the game
  final String id;

  /// The title of the game
  final String title;

  /// A brief description of the game
  final String description;

  /// The genre of the game
  final String genre;

  /// The rating of the game
  final double rating;

  /// The developer of the game
  final String developer;

  /// URL atau jalur ke gambar cover game
  final String imageUrl;

  /// Constructor untuk membuat instance Game
  const Game({
    required this.id,
    required this.title,
    required this.description,
    required this.genre,
    required this.rating,
    required this.developer,
    required this.imageUrl,
  });

  /// Membuat instance Game dari map JSON
  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      genre: json['genre'] as String,
      rating: (json['rating'] as num).toDouble(),
      developer: json['developer'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  /// Mengonversi instance Game ke map JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'genre': genre,
      'rating': rating,
      'developer': developer,
      'imageUrl': imageUrl,
    };
  }

  /// Membuat salinan Game dengan nilai baru opsional
  Game copyWith({
    String? id,
    String? title,
    String? description,
    String? genre,
    double? rating,
    String? developer,
    String? imageUrl,
  }) {
    return Game(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      genre: genre ?? this.genre,
      rating: rating ?? this.rating,
      developer: developer ?? this.developer,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() {
    return 'Game(id: $id, title: $title, genre: $genre, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Game && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
