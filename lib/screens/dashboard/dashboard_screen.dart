import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'profile_screen.dart';

/// Layar dashboard dengan navigasi bottom dan 3 tab utama
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /// Index tab yang aktif
  int _selectedIndex = 0;

  /// Daftar screen untuk setiap tab
  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const LibraryScreen(),
    const ProfileScreen(),
  ];

  /// Ubah tab yang aktif
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Bangun AppBar sesuai tab yang aktif
  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    switch (_selectedIndex) {
      case 0:

        /// AppBar untuk tab Home
        return AppBar(title: const Text(AppConstants.homeTitle));
      case 1:

        /// AppBar untuk tab Library dengan subtitle
        return AppBar(
          toolbarHeight: 84,
          titleSpacing: 16,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(AppConstants.libraryTitle),
              SizedBox(height: 6),
              Text(
                AppConstants.librarySubtitle,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        );
      case 2:

        /// AppBar untuk tab Profile
        return AppBar(title: const Text(AppConstants.profileTitle));
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: _buildAppBar(context),

      /// Gunakan IndexedStack untuk mempertahankan state setiap screen
      body: IndexedStack(index: _selectedIndex, children: _screens),

      /// Bottom navigation bar dengan 3 tab
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        height: 60,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.12),
        destinations: const [
          /// Tab Home
          NavigationDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets_rounded),
            label: AppConstants.homeTitle,
          ),

          /// Tab Library
          NavigationDestination(
            icon: Icon(Icons.collections_bookmark_outlined),
            selectedIcon: Icon(Icons.collections_bookmark_rounded),
            label: AppConstants.libraryTitle,
          ),

          /// Tab Profile
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: AppConstants.profileTitle,
          ),
        ],
      ),
    );
  }
}
