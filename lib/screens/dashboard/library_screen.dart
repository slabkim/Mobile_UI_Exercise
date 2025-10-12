import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_constants.dart';
import '../../models/game.dart';
import '../../providers/library_provider.dart';
import '../../widgets/game_item_card.dart';
import '../game_detail/game_detail_screen.dart';

/// Layar library menampilkan daftar permainan yang ditambahkan oleh pengguna.
/// Menampilkan pesan jika library kosong.
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final libraryProvider = context.watch<LibraryProvider>();
    final List<Game> libraryGames = libraryProvider.libraryGames;

    if (libraryGames.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.hourglass_empty_outlined,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Koleksi kamu masih kosong',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                AppConstants.emptyLibraryMessage,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Tambah game dari Beranda untuk memulai koleksi.',
                      ),
                    ),
                  );
                },
                child: const Text('Lihat rekomendasi'),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemBuilder: (context, index) {
        final game = libraryGames[index];
        return GameItemCard(
          layout: GameCardLayout.horizontal,
          game: game,
          actionLabel: 'Hapus',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameDetailScreen(game: game),
              ),
            );
          },
          onInstallTap: () {
            libraryProvider.removeGame(game);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${game.title} ${AppConstants.removedFromLibrary}',
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: libraryGames.length,
    );
  }
}
