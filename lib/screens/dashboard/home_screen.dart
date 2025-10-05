import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import '../../models/game.dart';
import '../../widgets/game_item_card.dart';
import '../game_detail/game_detail_screen.dart';

/// Layar beranda menampilkan daftar horizontal kategori permainan:
/// "Rekomendasi untuk Anda", "Sedang Trending", dan "Genre Populer".
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Data dummy untuk game
  static final List<Game> recommendedGames = [
    Game(
      id: '1',
      title: 'Epic Adventure',
      description: 'An epic adventure game with stunning visuals.',
      genre: 'Adventure',
      rating: 4.5,
      developer: 'Game Studio A',
      imageUrl: AppConstants.defaultGameImage,
    ),
    Game(
      id: '2',
      title: 'Space Shooter',
      description: 'Fast-paced space shooting game.',
      genre: 'Shooter',
      rating: 4.2,
      developer: 'Game Studio B',
      imageUrl: AppConstants.defaultGameImage,
    ),
  ];

  static final List<Game> trendingGames = [
    Game(
      id: '3',
      title: 'Puzzle Master',
      description: 'Challenging puzzles for all ages.',
      genre: 'Puzzle',
      rating: 4.7,
      developer: 'Game Studio C',
      imageUrl: AppConstants.defaultGameImage,
    ),
    Game(
      id: '4',
      title: 'Racing Pro',
      description: 'High-speed racing game with realistic physics.',
      genre: 'Racing',
      rating: 4.3,
      developer: 'Game Studio D',
      imageUrl: AppConstants.defaultGameImage,
    ),
  ];

  static final List<Game> popularGenres = [
    Game(
      id: '5',
      title: 'Fantasy RPG',
      description: 'Role-playing game set in a fantasy world.',
      genre: 'RPG',
      rating: 4.6,
      developer: 'Game Studio E',
      imageUrl: AppConstants.defaultGameImage,
    ),
    Game(
      id: '6',
      title: 'Strategy King',
      description: 'Strategic gameplay with multiple levels.',
      genre: 'Strategy',
      rating: 4.4,
      developer: 'Game Studio F',
      imageUrl: AppConstants.defaultGameImage,
    ),
  ];

  Widget _buildCategorySection(
    BuildContext context,
    String title,
    List<Game> games,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GameItemCard(
                  game: game,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GameDetailScreen(game: game),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildCategorySection(
          context,
          AppConstants.recommendedForYou,
          recommendedGames,
        ),
        _buildCategorySection(context, AppConstants.trendingNow, trendingGames),
        _buildCategorySection(
          context,
          AppConstants.popularGenres,
          popularGenres,
        ),
      ],
    );
  }
}
