/// Model game dengan informasi detail
class Game {
  /// ID unik game
  final String id;

  /// Judul game
  final String title;

  /// Deskripsi singkat game
  final String description;

  /// Genre game
  final String genre;

  /// Rating game
  final double rating;

  /// Developer game
  final String developer;

  /// URL gambar cover game
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

  /// Konversi dari JSON ke Game
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

  /// Konversi Game ke JSON
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

  /// Duplikat Game dengan nilai baru opsional
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

  /// Tampilkan info game
  @override
  String toString() {
    return 'Game(id: $id, title: $title, genre: $genre, rating: $rating)';
  }

  /// Bandingkan dua game berdasarkan ID
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Game && other.id == id;
  }

  /// Hash code berdasarkan ID
  @override
  int get hashCode => id.hashCode;
}
