/// Konstanta aplikasi yang berisi string, jalur gambar, dan nilai statis lainnya.
/// Berkas ini memusatkan semua nilai konstanta yang digunakan di seluruh aplikasi untuk memudahkan pemeliharaan.
class AppConstants {
  // App-wide strings
  static const String appName = 'Game Collection';
  static const String loginTitle = 'Login';
  static const String registerTitle = 'Register';
  static const String dashboardTitle = 'Dashboard';
  static const String homeTitle = 'Home';
  static const String libraryTitle = 'Library';
  static const String profileTitle = 'Profile';
  static const String gameDetailTitle = 'Game Details';

  // Button texts
  static const String loginButton = 'Login';
  static const String registerButton = 'Register';
  static const String logoutButton = 'Logout';
  static const String addToLibraryButton = 'Add to Library';
  static const String removeButton = 'Remove';

  // Link texts
  static const String noAccountLink = 'Belum punya akun? Register';
  static const String haveAccountLink = 'Sudah punya akun? Login';

  // Error messages
  static const String loginFailed = 'Login gagal. Periksa email dan password.';
  static const String registerFailed = 'Registrasi gagal. Coba lagi.';
  static const String emailRequired = 'Email wajib diisi';
  static const String passwordRequired = 'Password wajib diisi';
  static const String nameRequired = 'Nama wajib diisi';
  static const String passwordMismatch = 'Password tidak cocok';
  static const String invalidEmail = 'Format email tidak valid';
  static const String passwordTooShort = 'Password minimal 6 karakter';

  // Success messages
  static const String loginSuccess = 'Login berhasil!';
  static const String registerSuccess = 'Registrasi berhasil!';
  static const String addedToLibrary = 'Game ditambahkan ke library';
  static const String removedFromLibrary = 'Game dihapus dari library';

  // Placeholder texts
  static const String emailHint = 'Masukkan email';
  static const String passwordHint = 'Masukkan password';
  static const String confirmPasswordHint = 'Konfirmasi password';
  static const String nameHint = 'Masukkan nama';

  // Game categories
  static const String recommendedForYou = 'Rekomendasi untuk Anda';
  static const String trendingNow = 'Sedang Trending';
  static const String popularGenres = 'Genre Populer';

  // Library messages
  static const String emptyLibraryMessage =
      'Library kosong, tambahkan game favoritmu!';

  // Profile labels
  static const String nameLabel = 'Nama:';
  static const String emailLabel = 'Email:';

  // Loading texts
  static const String loading = 'Loading...';

  // Image paths (using placeholder URLs for demo)
  static const String defaultGameImage =
      'https://via.placeholder.com/150x200?text=Game+Image';

  // Dummy data
  static const String dummyUserName = 'Sulthon Abdul Hakim';
  static const String dummyUserEmail = 'sulthon@gmail.com';
  static const String dummyPassword = '123123';
}
