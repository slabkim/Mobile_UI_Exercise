import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../providers/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';
import 'login_page.dart';

/// Halaman register untuk membuat akun pengguna baru
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Key untuk validasi form
  final _formKey = GlobalKey<FormState>();

  /// Controller untuk input nama
  final _nameController = TextEditingController();

  /// Controller untuk input email
  final _emailController = TextEditingController();

  /// Controller untuk input password
  final _passwordController = TextEditingController();

  /// Controller untuk konfirmasi password
  final _confirmPasswordController = TextEditingController();

  /// Bersihkan semua controller saat halaman ditutup
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  /// Submit form register
  void _submit() async {
    /// Validasi form terlebih dahulu
    if (!_formKey.currentState!.validate()) return;

    /// Ambil auth provider dari context
    final authProvider = context.read<AuthProvider>();

    /// Panggil register dengan data form
    final success = await authProvider.register(
      _nameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text.trim(),
      _confirmPasswordController.text.trim(),
    );

    /// Cek apakah widget masih mounted
    if (success) {
      if (!mounted) return;

      /// Navigasi ke dashboard jika register berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashboardScreen()),
      );
    } else {
      if (!mounted) return;

      /// Tampilkan error message jika register gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            authProvider.errorMessage ?? AppConstants.registerFailed,
          ),
        ),
      );
    }
  }

  /// Bangun header dengan ikon dan teks penjelasan
  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Container dengan ikon dan teks
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.rocket_launch_outlined,
                color: colorScheme.primary,
                size: 26,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.registerTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Akses akunmu di semua perangkat',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.primary.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        /// Judul halaman
        Text(
          AppConstants.registerHeadline,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 12),

        /// Subtitle penjelasan
        Text(
          AppConstants.registerSubtitle,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700], height: 1.4),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Watch auth provider untuk update status loading
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header dengan ikon dan penjelasan
                  _buildHeader(context),
                  const SizedBox(height: 32),

                  /// Form register
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 32, 28, 12),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            /// Input nama
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                labelText: 'Nama lengkap',
                                hintText: AppConstants.nameHint,
                                prefixIcon: const Icon(Icons.person_outline),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppConstants.nameRequired;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 18),

                            /// Input email
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                hintText: AppConstants.emailHint,
                                prefixIcon: const Icon(Icons.alternate_email),
                              ),
                              keyboardType: TextInputType.emailAddress,
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
                            const SizedBox(height: 18),

                            /// Input password
                            TextFormField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                hintText: AppConstants.passwordHint,
                                prefixIcon: Icon(Icons.lock_outline_rounded),
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
                            const SizedBox(height: 18),

                            /// Input konfirmasi password
                            TextFormField(
                              controller: _confirmPasswordController,
                              decoration: const InputDecoration(
                                labelText: 'Konfirmasi password',
                                hintText: AppConstants.confirmPasswordHint,
                                prefixIcon: Icon(Icons.lock_person_outlined),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppConstants.passwordRequired;
                                }
                                if (value != _passwordController.text) {
                                  return AppConstants.passwordMismatch;
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),

                            /// Tombol submit
                            FilledButton(
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
                                            strokeWidth: 2.2,
                                            valueColor: AlwaysStoppedAnimation(
                                              Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Text('Mendaftarkan akun...'),
                                      ],
                                    )
                                  : const Text(AppConstants.registerButton),
                            ),
                            const SizedBox(height: 18),

                            /// Tombol register dengan Google
                            OutlinedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Daftar dengan Google akan segera tersedia.',
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.g_mobiledata, size: 28),
                              label: const Text('Daftar dengan Google'),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Link ke halaman login
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: const Text(AppConstants.haveAccountLink),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// Disclaimer privasi
                  Center(
                    child: Text(
                      'Dengan mendaftar kamu menyetujui kebijakan privasi PauseStore.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
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
