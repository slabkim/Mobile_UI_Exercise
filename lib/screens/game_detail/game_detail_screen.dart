import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../models/game.dart';
import 'package:provider/provider.dart';
import '../../providers/library_provider.dart';

/// Layar yang menampilkan informasi detail tentang permainan,
/// dengan opsi untuk menambahkan permainan ke library.
class GameDetailScreen extends StatelessWidget {
  final Game game;

  /// Membuat widget GameDetailScreen.
  const GameDetailScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final libraryProvider = context.watch<LibraryProvider>();
    final isInLibrary = libraryProvider.isInLibrary(game);

    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.gameDetailTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Game cover image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  game.imageUrl,
                  height: 300,
                  width: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 300,
                    width: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 48),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              game.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Genre: ${game.genre}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 4),
            Text(
              'Rating: ${game.rating.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              'Developer: ${game.developer}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(game.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: isInLibrary
                    ? null
                    : () {
                        libraryProvider.addGame(game);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(AppConstants.addedToLibrary),
                          ),
                        );
                      },
                child: Text(
                  isInLibrary
                      ? AppConstants.addToLibraryButton + ' (Added)'
                      : AppConstants.addToLibraryButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
