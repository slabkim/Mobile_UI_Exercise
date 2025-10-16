import 'package:flutter/material.dart';

import '../models/game.dart';

/// Enum untuk menentukan layout kartu game (vertikal atau horizontal)
enum GameCardLayout { vertical, horizontal }

/// Widget kartu game yang dapat ditampilkan dalam dua layout berbeda
class GameItemCard extends StatelessWidget {
  /// Data game yang akan ditampilkan
  final Game game;

  /// Callback saat kartu diklik
  final VoidCallback? onTap;

  /// Callback saat tombol action diklik
  final VoidCallback? onInstallTap;

  /// Layout kartu (vertikal atau horizontal)
  final GameCardLayout layout;

  /// Label untuk tombol action
  final String? actionLabel;

  /// Tampilkan tombol action atau tidak
  final bool showAction;

  const GameItemCard({
    super.key,
    required this.game,
    this.onTap,
    this.onInstallTap,
    this.layout = GameCardLayout.vertical,
    this.actionLabel,
    this.showAction = true,
  });

  /// Placeholder gambar saat gagal load
  Widget _imagePlaceholder({double? width, double? height}) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey.shade200,
      child: const Icon(Icons.image_outlined, size: 32),
    );
  }

  /// Tampilkan rating dengan bintang
  Widget _stars(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
        const SizedBox(width: 4),
        Text(
          game.rating.toStringAsFixed(1),
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  /// Bangun tombol action
  Widget _actionButton(BuildContext context) {
    if (!showAction) return const SizedBox.shrink();

    final label = actionLabel ?? 'Tambah';
    final callback =
        onInstallTap ??
        () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('$label ${game.title}')));
        };

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(onPressed: callback, child: Text(label)),
    );
  }

  /// Bangun kartu vertikal (grid layout)
  Widget _buildVerticalCard(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 170,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Gambar game
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  game.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _imagePlaceholder(),
                ),
              ),

              /// Info game
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Judul game
                    Text(
                      game.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),

                    /// Developer
                    Text(
                      game.developer,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),

                    /// Rating
                    _stars(context),
                    if (showAction) ...[
                      const SizedBox(height: 12),
                      _actionButton(context),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Bangun kartu horizontal (list layout)
  Widget _buildHorizontalCard(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              /// Gambar game dengan ukuran kecil
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  game.imageUrl,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      _imagePlaceholder(width: 72, height: 72),
                ),
              ),
              const SizedBox(width: 16),

              /// Info game (expandable)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Judul game
                    Text(
                      game.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    /// Developer
                    Text(
                      game.developer,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 8),

                    /// Rating
                    _stars(context),
                  ],
                ),
              ),

              /// Tombol action
              if (showAction) ...[
                const SizedBox(width: 12),
                _actionButton(context),
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Pilih layout berdasarkan enum
    return layout == GameCardLayout.horizontal
        ? _buildHorizontalCard(context)
        : _buildVerticalCard(context);
  }
}
