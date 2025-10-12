/// Konstanta aplikasi yang berisi string, jalur gambar, dan nilai statis lainnya.
/// Berkas ini memusatkan semua nilai konstanta yang digunakan di seluruh aplikasi untuk memudahkan pemeliharaan.
class AppConstants {
  // App-wide strings
  static const String appName = 'PauseStore';
  static const String appTagline =
      'Temukan game favoritmu seperti di Play Store';
  static const String loginTitle = 'Masuk';
  static const String loginHeadline = 'Selamat datang kembali';
  static const String loginSubtitle =
      'Masuk untuk melanjutkan progres dan jelajahi rilisan terbaru.';
  static const String registerTitle = 'Daftar';
  static const String registerHeadline = 'Bergabung dengan PauseStore';
  static const String registerSubtitle =
      'Buat akunmu agar tidak ketinggalan update dan rekomendasi personal.';
  static const String dashboardTitle = 'Dashboard';
  static const String homeTitle = 'Beranda';
  static const String libraryTitle = 'Koleksi';
  static const String librarySubtitle =
      'Kelola game yang sudah kamu simpan dan lanjutkan petualanganmu.';
  static const String profileTitle = 'Profil';
  static const String profileGreeting = 'Hai,';
  static const String profileTagline =
      'Kelola akun dan personalisasimu di sini.';
  static const String gameDetailTitle = 'Detail Game';
  static const String splashHeadline = 'PauseStore';
  static const String splashSubtitle =
      'Temukan game terbaik dengan feel Google Play';

  // Button texts
  static const String loginButton = 'Masuk';
  static const String registerButton = 'Buat Akun';
  static const String logoutButton = 'Keluar';
  static const String addToLibraryButton = 'Tambah ke Koleksi';
  static const String removeButton = 'Hapus';

  // Link texts
  static const String noAccountLink = 'Belum punya akun? Daftar sekarang';
  static const String haveAccountLink = 'Sudah punya akun? Masuk di sini';

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
  static const String recommendedForYou = 'Untuk kamu';
  static const String trendingNow = 'Trending saat ini';
  static const String popularGenres = 'Genre populer';
  static const String topCharts = 'Top chart';
  static const String newUpdates = 'Update terbaru';

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
