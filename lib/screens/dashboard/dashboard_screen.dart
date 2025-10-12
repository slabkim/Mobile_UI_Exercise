import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'profile_screen.dart';

/// Layar dasbor dengan BottomNavigationBar dan IndexedStack untuk mempertahankan status.
/// Berisi tab Beranda, library, dan Profil.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const LibraryScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        return AppBar(title: const Text(AppConstants.homeTitle));
      case 1:
        return AppBar(
          title: const Text(AppConstants.libraryTitle),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(28),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 12),
                child: Text(
                  AppConstants.librarySubtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ),
            ),
          ),
        );
      case 2:
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
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onItemTapped,
        height: 60,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.primary.withOpacity(0.12),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.widgets_outlined),
            selectedIcon: Icon(Icons.widgets_rounded),
            label: AppConstants.homeTitle,
          ),
          NavigationDestination(
            icon: Icon(Icons.collections_bookmark_outlined),
            selectedIcon: Icon(Icons.collections_bookmark_rounded),
            label: AppConstants.libraryTitle,
          ),
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
