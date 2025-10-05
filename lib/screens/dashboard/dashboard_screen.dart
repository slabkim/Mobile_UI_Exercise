import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';
import 'home_screen.dart';
import 'library_screen.dart';
import 'profile_screen.dart';

/// Layar dasbor dengan BottomNavigationBar dan IndexedStack untuk mempertahankan status.
/// Berisi tab Beranda, library, dan Profil.
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstants.dashboardTitle)),
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppConstants.homeTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: AppConstants.libraryTitle,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppConstants.profileTitle,
          ),
        ],
      ),
    );
  }
}
