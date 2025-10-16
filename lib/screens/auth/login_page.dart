import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../providers/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';
import 'register_page.dart';

/// Halaman login untuk autentikasi pengguna
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  /// Controller untuk input email
  final _emailController = TextEditingController();

  /// Controller untuk input password
  final _passwordController = TextEditingController();

  /// Bersihkan controller saat halaman ditutup
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Submit form login
  Future<void> _submit() async {
    /// Validasi form terlebih dahulu
    if (!_formKey.currentState!.validate()) return;

    /// Ambil auth provider dari context
    final authProvider = context.read<AuthProvider>();

    /// Panggil login dengan email dan password
    final success = await authProvider.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    /// Cek apakah widget masih mounted
    if (!mounted) return;

    /// Jika login berhasil, navigasi ke dashboard
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
      return;
    }

    /// Tampilkan error message jika login gagal
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(authProvider.errorMessage ?? AppConstants.loginFailed),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Watch auth provider untuk update status loading
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Masuk')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Judul aplikasi
                  Text(
                    AppConstants.appName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// Subtitle
                  Text(
                    'Masuk untuk melanjutkan pengalaman bermainmu.',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 32),

                  /// Form login
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            /// Input email
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                hintText: AppConstants.emailHint,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppConstants.emailRequired;
                                }
                                final emailRegex = RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                );
                                if (!emailRegex.hasMatch(value)) {
                                  return AppConstants.invalidEmail;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            /// Input password
                            TextFormField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                hintText: AppConstants.passwordHint,
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppConstants.passwordRequired;
                                }
                                if (value.length < 6) {
                                  return AppConstants.passwordTooShort;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),

                            /// Tombol submit
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: authProvider.isLoading
                                    ? null
                                    : _submit,
                                child: authProvider.isLoading
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            width: 18,
                                            height: 18,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                    Colors.white,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Text('Memproses...'),
                                        ],
                                      )
                                    : const Text(AppConstants.loginButton),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Link ke halaman register
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(AppConstants.noAccountLink),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
