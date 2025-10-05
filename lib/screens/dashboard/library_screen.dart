import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_constants.dart';
import '../../models/game.dart';
import '../../providers/library_provider.dart';
// import '../../widgets/game_item_card.dart';  // untuk sekarang tidak dipakai tetapi nantinya akan dipakai
import '../game_detail/game_detail_screen.dart';

/// Layar library menampilkan daftar permainan yang ditambahkan oleh pengguna.
/// Menampilkan pesan jika library kosong.
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final libraryProvider = context.watch<LibraryProvider>();
    final List<Game> libraryGames = libraryProvider.libraryGames;

    if (libraryGames.isEmpty) {
      return Center(
        child: Text(
          AppConstants.emptyLibraryMessage,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: libraryGames.length,
      itemBuilder: (context, index) {
        final game = libraryGames[index];
        return ListTile(
          leading: Image.network(
            game.imageUrl,
            width: 50,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: 50,
              height: 70,
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, size: 24),
            ),
          ),
          title: Text(game.title),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle, color: Colors.red),
            onPressed: () {
              libraryProvider.removeGame(game);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${game.title} ${AppConstants.removedFromLibrary}',
                  ),
                ),
              );
            },
          ),
          onTap: () {
            // navigasi ke detail screen ketika di tap
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameDetailScreen(game: game),
              ),
            );
          },
        );
      },
    );
  }
}
