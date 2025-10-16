import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../providers/auth_provider.dart';
import '../../providers/library_provider.dart';
import '../../providers/theme_provider.dart';
import '../auth/login_page.dart';

/// Halaman profil untuk menampilkan info user dan pengaturan aplikasi
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Watch semua provider yang diperlukan
    final authProvider = context.watch<AuthProvider>();
    final libraryProvider = context.watch<LibraryProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final user = authProvider.user;

    /// Tampilkan pesan jika belum login
    if (user == null) {
      return Center(
        child: Text(
          'User not logged in',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    /// Hitung statistik library
    final totalGames = libraryProvider.libraryGames.length;
    final latestTitle = totalGames > 0
        ? libraryProvider.libraryGames.last.title
        : null;
    final themeMode = themeProvider.themeMode;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      children: [
        /// Kartu profil user dengan avatar
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                /// Avatar dengan gambar dari assets
                CircleAvatar(
                  radius: 28,
                  backgroundImage: const AssetImage(
                    'assets/images/Sulthon Abdul.JPG',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Nama user
                      Text(
                        user.name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),

                      /// Email user
                      Text(
                        user.email,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        /// Kartu pengaturan tema aplikasi
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                leading: Icon(Icons.color_lens_outlined),
                title: Text('Tema aplikasi'),
                subtitle: Text(
                  'Pilih tampilan terang, gelap, atau mengikuti tema handphone.',
                ),
              ),
              const Divider(height: 1),

              /// Segmented button untuk pilih tema
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(
                      value: ThemeMode.system,
                      label: Text('Sistem'),
                      icon: Icon(Icons.phone_iphone),
                    ),
                    ButtonSegment(
                      value: ThemeMode.light,
                      label: Text('Terang'),
                      icon: Icon(Icons.wb_sunny_outlined),
                    ),
                    ButtonSegment(
                      value: ThemeMode.dark,
                      label: Text('Gelap'),
                      icon: Icon(Icons.nightlight_round),
                    ),
                  ],
                  selected: {themeMode},
                  onSelectionChanged: (modes) {
                    if (modes.isNotEmpty) {
                      themeProvider.setThemeMode(modes.first);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        /// Kartu ringkasan akun dan statistik
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Judul ringkasan akun
                Text(
                  'Ringkasan akun',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                /// Total game di koleksi
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.collections_bookmark_outlined),
                  title: const Text('Koleksi kamu'),
                  subtitle: Text(
                    totalGames > 0
                        ? '$totalGames game tersimpan'
                        : 'Belum ada game di koleksi',
                  ),
                ),

                /// Game terbaru ditambahkan
                if (latestTitle != null) ...[
                  const Divider(height: 1),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.schedule_outlined),
                    title: const Text('Terbaru ditambahkan'),
                    subtitle: Text(latestTitle),
                  ),
                ],

                const Divider(height: 1),

                /// Pengingat/tagline profil
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.info_outline_rounded),
                  title: const Text('Pengingat'),
                  subtitle: Text(AppConstants.profileTagline),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        /// Kartu bantuan dan informasi
        Card(
          child: Column(
            children: [
              /// Menu bantuan & feedback
              ListTile(
                leading: const Icon(Icons.help_outline_rounded),
                title: const Text('Bantuan & feedback'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Bantuan akan segera tersedia.'),
                    ),
                  );
                },
              ),
              const Divider(height: 1),

              /// Menu tentang PauseStore
              ListTile(
                leading: const Icon(Icons.info_outline_rounded),
                title: const Text('Tentang PauseStore'),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Versi 1.0.0')));
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        /// Tombol logout
        FilledButton(
          onPressed: () {
            authProvider.logout();

            /// Navigasi ke login dan hapus semua route sebelumnya
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
              (route) => false,
            );
          },
          style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
          child: const Text(AppConstants.logoutButton),
        ),
      ],
    );
  }
}
