import 'package:flutter/material.dart';

import '../../models/game.dart';
import '../../models/game_category.dart';
import '../../services/game_service.dart';
import '../../widgets/game_item_card.dart';
import '../../widgets/loading_indicator.dart';
import '../game_detail/game_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<GameCategory>>? _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = GameService.fetchCategories();
  }

  Widget _sectionHeader(BuildContext context, String title, String subtitle) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildCarousel(BuildContext context, {required List<Game> games}) {
    if (games.isEmpty) {
      return const SizedBox(
        height: 240,
        child: Center(child: Text('No games available')),
      );
    }

    return SizedBox(
      height: 240,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final game = games[index];
          return GameItemCard(
            game: game,
            showAction: false,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GameDetailScreen(game: game)),
              );
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: games.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GameCategory>>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
                const SizedBox(height: 16),
                Text(
                  'Error loading games',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  snapshot.error.toString(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _categoriesFuture = GameService.fetchCategories();
                    });
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final categories = snapshot.data ?? [];
        if (categories.isEmpty) {
          return const Center(child: Text('No categories available'));
        }

        final children = <Widget>[];
        for (final category in categories) {
          if (children.isNotEmpty) {
            children.add(const SizedBox(height: 32));
          }
          children.addAll([
            _sectionHeader(
              context,
              category.title,
              category.subtitle,
            ),
            const SizedBox(height: 16),
            _buildCarousel(context, games: category.games),
          ]);
        }

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          children: children,
        );
      },
    );
  }
}
