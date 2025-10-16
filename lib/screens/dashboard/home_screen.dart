import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/game.dart';
import '../../models/game_category.dart';
import '../../services/game_service.dart';
import '../../widgets/loading_indicator.dart';
import '../../providers/library_provider.dart';
import '../../constants/app_constants.dart';
import '../game_detail/game_detail_screen.dart';

/// Halaman utama yang menampilkan kategori game dengan tab dan banner
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Future untuk fetch kategori game
  Future<List<GameCategory>>? _categoriesFuture;

  /// Index tab yang dipilih
  int _selectedTabIndex = 0;

  /// Daftar tab navigasi
  final List<String> _tabs = [
    'Untuk Anda',
    'Paling populer',
    'Game',
    'Kategory',
  ];

  @override
  void initState() {
    super.initState();

    /// Fetch kategori saat halaman dimuat
    _categoriesFuture = GameService.fetchCategories();
  }

  /// Bangun tab bar dengan scroll horizontal
  Widget _buildTabBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final Color baseTextColor =
        theme.textTheme.bodyMedium?.color ?? colorScheme.onSurface;
    final Color unselectedColor = baseTextColor.withValues(
      alpha: theme.brightness == Brightness.dark ? 0.7 : 0.6,
    );

    return Container(
      color: colorScheme.surface,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: _tabs.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedTabIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// Teks tab dengan warna berbeda saat dipilih
                        Text(
                          _tabs[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? colorScheme.primary
                                : unselectedColor,
                          ),
                        ),

                        /// Garis indikator untuk tab aktif
                        if (isSelected)
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            height: 3,
                            width: 40,
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(1.5),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1, color: theme.dividerColor),
        ],
      ),
    );
  }

  /// Bangun kartu banner untuk featured game
  Widget _buildBannerCard(Game game) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(game.imageUrl),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {},
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),

          /// Gradient overlay dari atas ke bawah
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black54],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dari editor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                game.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                game.description,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Bangun item game dengan gambar, info, dan tombol install
  Widget _buildAppItem(Game game) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final Color mutedTextColor =
        theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.65) ??
        colorScheme.onSurface.withValues(alpha: 0.65);
    final Color placeholderColor = theme.colorScheme.surfaceContainerHighest;
    final libraryProvider = context.watch<LibraryProvider>();
    final isInLibrary = libraryProvider.isInLibrary(game);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => GameDetailScreen(game: game)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            /// Gambar game dengan border radius
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                game.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 80,
                  height: 80,
                  color: placeholderColor,
                  child: const Icon(Icons.broken_image),
                ),
              ),
            ),
            const SizedBox(width: 12),

            /// Info game (judul, genre, rating)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${game.genre} - ${game.developer}',
                    style: TextStyle(fontSize: 12, color: mutedTextColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        game.rating.toStringAsFixed(1),
                        style: TextStyle(fontSize: 12, color: mutedTextColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Tombol install/added
            ElevatedButton(
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
              style: ElevatedButton.styleFrom(
                backgroundColor: isInLibrary ? Colors.grey[400] : Colors.blue,
                foregroundColor: isInLibrary ? Colors.grey[700] : Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(isInLibrary ? 'Added' : 'Instal'),
            ),
          ],
        ),
      ),
    );
  }

  /// Bangun header section dengan judul dan menu
  Widget _buildSectionHeader(String title) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.more_vert, color: colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }

  /// Bangun section kategori game
  Widget _buildCategorySection(
    List<GameCategory> categories,
    String categoryTitle,
    String categoryId,
  ) {
    /// Cari kategori berdasarkan ID
    final matching = categories.where((cat) => cat.id == categoryId);
    final GameCategory? category = matching.isNotEmpty ? matching.first : null;

    if (category == null || category.games.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(categoryTitle),

        /// Tampilkan 3 game pertama
        ...category.games.take(3).map((game) => _buildAppItem(game)),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GameCategory>>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final Color mutedTextColor =
            theme.textTheme.bodySmall?.color?.withValues(alpha: 0.65) ??
            colorScheme.onSurface.withValues(alpha: 0.65);
        final Color placeholderColor =
            theme.colorScheme.surfaceContainerHighest;

        /// Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: LoadingIndicator());
        }

        /// Error state
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
                const SizedBox(height: 16),
                Text('Error loading games', style: theme.textTheme.titleMedium),
                const SizedBox(height: 16),

                /// Tombol retry untuk reload data
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

        /// Kumpulkan semua game dari semua kategori
        final allGames = <Game>[];
        for (final category in categories) {
          allGames.addAll(category.games);
        }

        /// CustomScrollView dengan pinned tab bar
        return CustomScrollView(
          slivers: [
            /// Tab Bar (tetap di atas saat scroll)
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverFixedHeaderDelegate(
                minHeight: 60,
                maxHeight: 60,
                child: _buildTabBar(context),
              ),
            ),

            /// Konten utama
            SliverList(
              delegate: SliverChildListDelegate([
                /// Banner dan featured section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (allGames.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  GameDetailScreen(game: allGames[0]),
                            ),
                          );
                        },
                        child: _buildBannerCard(allGames[0]),
                      ),

                    /// Featured app card
                    if (allGames.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => GameDetailScreen(
                                game: allGames[1 % allGames.length],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: theme.cardColor,
                            border: Border.all(color: theme.dividerColor),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  allGames[1 % allGames.length].imageUrl,
                                  width: 56,
                                  height: 56,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        width: 56,
                                        height: 56,
                                        color: placeholderColor,
                                        child: const Icon(Icons.broken_image),
                                      ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      allGames[1 % allGames.length].title,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      allGames[1 % allGames.length].developer,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: mutedTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          size: 12,
                                          color: Colors.amber,
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          allGames[1 % allGames.length].rating
                                              .toStringAsFixed(1),
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: mutedTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              /// Tombol install featured
                              ElevatedButton(
                                onPressed: () {
                                  final libraryProvider = context
                                      .read<LibraryProvider>();
                                  final game = allGames[1 % allGames.length];
                                  final isInLibrary = libraryProvider
                                      .isInLibrary(game);
                                  if (!isInLibrary) {
                                    libraryProvider.addGame(game);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          AppConstants.addedToLibrary,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 6,
                                  ),
                                ),
                                child: Consumer<LibraryProvider>(
                                  builder: (context, libraryProvider, child) {
                                    final game = allGames[1 % allGames.length];
                                    final isInLibrary = libraryProvider
                                        .isInLibrary(game);
                                    return Text(
                                      isInLibrary ? 'Added' : 'Instal',
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),

                /// Section untuk setiap kategori game
                _buildCategorySection(
                  categories,
                  'Game Populer',
                  'popular_games',
                ),
                _buildCategorySection(
                  categories,
                  'Sosial Media & Komunikasi',
                  'social_media',
                ),
                _buildCategorySection(
                  categories,
                  'Hiburan & Streaming',
                  'entertainment',
                ),
                _buildCategorySection(
                  categories,
                  'Belanja & E-Commerce',
                  'shopping',
                ),
                _buildCategorySection(
                  categories,
                  'Produktivitas & Utilitas',
                  'productivity',
                ),
                _buildCategorySection(
                  categories,
                  'Keuangan & Dompet Digital',
                  'finance',
                ),
                const SizedBox(height: 32),
              ]),
            ),
          ],
        );
      },
    );
  }
}

/// Delegate untuk SliverPersistentHeader dengan ukuran fixed
class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  /// Tinggi minimum header
  final double minHeight;

  /// Tinggi maksimum header
  final double maxHeight;

  /// Widget child yang akan ditampilkan
  final Widget child;

  _SliverFixedHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  /// Bangun header
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  /// Cek apakah perlu rebuild
  @override
  bool shouldRebuild(covariant _SliverFixedHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
