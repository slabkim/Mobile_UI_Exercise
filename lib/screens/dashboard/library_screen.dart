import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_constants.dart';
import '../../models/game.dart';
import '../../providers/library_provider.dart';
import '../../widgets/game_item_card.dart';
import '../game_detail/game_detail_screen.dart';

/// Halaman library yang menampilkan daftar game yang disimpan pengguna
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Watch library provider untuk update saat ada perubahan
    final libraryProvider = context.watch<LibraryProvider>();
    final List<Game> libraryGames = libraryProvider.libraryGames;

    /// Tampilkan pesan kosong jika library belum ada game
    if (libraryGames.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Ikon kosong
              Icon(
                Icons.hourglass_empty_outlined,
                size: 48,
                color: Colors.black,
              ),
              const SizedBox(height: 16),

              /// Judul pesan kosong
              Text(
                'Koleksi kamu masih kosong',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),

              /// Deskripsi pesan kosong
              Text(
                AppConstants.emptyLibraryMessage,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              /// Tombol untuk ke halaman home
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
                child: const Text(
                  'Lihat rekomendasi',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    }

    /// Tampilkan list game di library
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemBuilder: (context, index) {
        final game = libraryGames[index];
        return GameItemCard(
          layout: GameCardLayout.horizontal,
          game: game,
          actionLabel: 'Hapus',

          /// Navigasi ke detail game saat diklik
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameDetailScreen(game: game),
              ),
            );
          },

          /// Hapus game dari library saat tombol ditekan
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

      /// Separator antar item
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemCount: libraryGames.length,
    );
  }
}
