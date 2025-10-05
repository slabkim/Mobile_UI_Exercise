import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_constants.dart';
import '../../providers/auth_provider.dart';
import '../auth/login_page.dart';

/// Profile screen displaying user information and a logout button.
class ProfileScreen extends StatelessWidget {
  /// Creates a ProfileScreen widget.
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: user == null
          ? Center(
              child: Text(
                'User not logged in',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AppConstants.nameLabel} ${user.name}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  '${AppConstants.emailLabel} ${user.email}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      authProvider.logout();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                        (route) => false,
                      );
                    },
                    child: const Text(AppConstants.logoutButton),
                  ),
                ),
              ],
            ),
    );
  }
}
