import '../models/game.dart';
import '../models/game_category.dart';

/// Service untuk mengelola data game dan kategori dengan simulasi API
class GameService {
  /// Delay simulasi jaringan untuk semua fetch operation
  static const Duration _networkDelay = Duration(milliseconds: 600);

  /// Daftar kategori game dengan data dummy
  static final List<GameCategory> _categories = [
    GameCategory(
      id: 'social_media',
      title: 'Sosial Media & Komunikasi',
      subtitle: 'Aplikasi komunikasi dan jejaring sosial populer.',
      games: [
        Game(
          id: 'com.whatsapp',
          title: 'WhatsApp Messenger',
          description: 'Pesan instan, panggilan suara, dan video gratis.',
          genre: 'Komunikasi',
          rating: 4.7,
          developer: 'WhatsApp LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/bYtqbOcTYOlgc6gqZ2rwb8lptHuwlNE75zYJu6Bn076-hTmvd96HH-6v7S0YUAAJXoJN=w240-h480-rw',
        ),
        Game(
          id: 'org.telegram.messenger',
          title: 'Telegram',
          description:
              'Chat cepat dan aman dengan dukungan bot, channel, dan grup besar.',
          genre: 'Komunikasi',
          rating: 4.4,
          developer: 'Telegram FZ-LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/ZU9cSsyIJZo6Oy7HTHiEPwZg0m2Crep-d5ZrfajqtsH-qgUXSqKpNA2FpPDTn-7qA5Q=w240-h480-rw',
        ),
        Game(
          id: 'com.instagram.android',
          title: 'Instagram',
          description:
              'Bagikan foto, video, Reels, dan cerita dengan teman dan komunitas.',
          genre: 'Sosial',
          rating: 4.2,
          developer: 'Instagram',
          imageUrl:
              'https://play-lh.googleusercontent.com/VRMWkE5p3CkWhJs6nv-9ZsLAs1QOg5ob1_3qg-rckwYW7yp1fMrYZqnEFpk0IoVP4LM=w240-h480-rw',
        ),
      ],
    ),
    GameCategory(
      id: 'entertainment',
      title: 'Hiburan & Streaming',
      subtitle: 'Layanan video, musik, dan live streaming.',
      games: [
        Game(
          id: 'com.google.android.youtube',
          title: 'YouTube',
          description:
              'Streaming video, shorts, dan konten kreator favorit secara gratis.',
          genre: 'Hiburan',
          rating: 4.5,
          developer: 'Google LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/6am0i3walYwNLc08QOOhRJttQENNGkhlKajXSERf3JnPVRQczIyxw2w3DxeMRTOSdsY=w240-h480-rw',
        ),
        Game(
          id: 'com.netflix.mediaclient',
          title: 'Netflix',
          description:
              'Tonton film, serial, dan anime original kapan pun tanpa iklan.',
          genre: 'Streaming',
          rating: 4.4,
          developer: 'Netflix, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/TBRwjS_qfJCSj1m7zZB93FnpJM5fSpMA_wUlFDLxWAb45T9RmwBvQd5cWR5viJJOhkI=w240-h480-rw',
        ),
        Game(
          id: 'com.spotify.music',
          title: 'Spotify',
          description:
              'Streaming musik, podcast, dan playlist yang dikurasi khusus Anda.',
          genre: 'Musik',
          rating: 4.6,
          developer: 'Spotify AB',
          imageUrl:
              'https://play-lh.googleusercontent.com/7ynvVIRdhJNAngCg_GI7i8TtH8BqkJYmffeUHsG-mJOdzt1XLvGmbsKuc5Q1SInBjDKN=w240-h480-rw',
        ),
      ],
    ),
    GameCategory(
      id: 'popular_games',
      title: 'Game Populer',
      subtitle: 'Game yang sedang tren dan banyak dimainkan.',
      games: [
        Game(
          id: 'com.dts.freefireth',
          title: 'Garena Free Fire',
          description:
              'Battle royale berdurasi cepat dengan berbagai karakter unik.',
          genre: 'Action',
          rating: 4.3,
          developer: 'Garena International I',
          imageUrl:
              'https://play-lh.googleusercontent.com/jHnf_3-yMox_Tub_oLKQ7OuOi8Iahf1f4rdu-etZ2hmzUOekY84znct-c8hksxhD15PYNk4dMH2ZdVY3uxm7Gw=s48-rw',
        ),
        Game(
          id: 'com.tencent.ig',
          title: 'PUBG MOBILE',
          description:
              'Battle royale realistis dengan mode kompetitif 100 pemain.',
          genre: 'Shooter',
          rating: 4.4,
          developer: 'Level Infinite',
          imageUrl:
              'https://play-lh.googleusercontent.com/zCSGnBtZk0Lmp1BAbyaZfLktDzHmC6oke67qzz3G1lBegAF2asyt5KzXOJ2PVdHDYkU=s96-rw',
        ),
        Game(
          id: 'com.mobile.legends',
          title: 'Mobile Legends: Bang Bang',
          description:
              'MOBA 5v5 cepat dengan hero beragam dan meta kompetitif.',
          genre: 'MOBA',
          rating: 4.6,
          developer: 'Moonton',
          imageUrl:
              'https://play-lh.googleusercontent.com/r54MhnxVyVOhlNQm5QDkwJqwTbiBDojbQ0ZhC1iGGkZo1Z0upUQuzF8rqVbw-Q91PL2ADXz0SzkK1mrO4xwqug=s96-rw',
        ),
      ],
    ),
    GameCategory(
      id: 'shopping',
      title: 'Belanja & E-Commerce',
      subtitle: 'Belanja online dan marketplace populer.',
      games: [
        Game(
          id: 'com.tokopedia.tkpd',
          title: 'Tokopedia',
          description:
              'Marketplace lengkap dengan promo harian dan bebas ongkir.',
          genre: 'Belanja',
          rating: 4.7,
          developer: 'Tokopedia',
          imageUrl:
              'https://play-lh.googleusercontent.com/BVfL-z6kQFdkg7-8J7Krscp7m6sYv7BuVT1U3wjggB2SXjJeo-IIUbBnAvUzNkjdzqk=w240-h480-rw',
        ),
        Game(
          id: 'com.shopee.id',
          title: 'Shopee',
          description:
              'Belanja hemat dengan flash sale, live shopping, dan ShopeePay.',
          genre: 'Belanja',
          rating: 4.6,
          developer: 'Shopee',
          imageUrl:
              'https://play-lh.googleusercontent.com/HtzhEP3R4DJ9h8LE4vQOs-veT63v-60V6UwzqoQtd3l_-qkPVbEcxZv5hEVUAuJuXg=w240-h480-rw',
        ),
        Game(
          id: 'com.bukalapak.android',
          title: 'Bukalapak',
          description:
              'Belanja produk UMKM lokal, tiket, dan bayar tagihan dalam satu aplikasi.',
          genre: 'Belanja',
          rating: 4.5,
          developer: 'PT Bukalapak.com',
          imageUrl:
              'https://play-lh.googleusercontent.com/XHV1b3sL5GnU5uYp4SrBUHtcBHtRn84Pzxigx-dkJwD57NjFB14M3dKYiu7VddTlZdG_=w240-h480-rw',
        ),
      ],
    ),
    GameCategory(
      id: 'productivity',
      title: 'Produktivitas & Utilitas',
      subtitle: 'Aplikasi kantor, catatan, dan alat produktivitas.',
      games: [
        Game(
          id: 'com.google.android.keep',
          title: 'Google Keep',
          description:
              'Catatan ringan dengan checklist, gambar, dan pengingat lokasi.',
          genre: 'Produktivitas',
          rating: 4.5,
          developer: 'Google LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/9bJoeaPbGTB8Tz_h4N-p-6ReRd8vSS-frZb2tmJulaGIoTKElKj3zpmcFJvnS96ANZP5=w480-h960-rw',
        ),
        Game(
          id: 'com.microsoft.office.onenote',
          title: 'Microsoft OneNote',
          description:
              'Notebook digital untuk mencatat ide, tugas, dan meeting.',
          genre: 'Produktivitas',
          rating: 4.6,
          developer: 'Microsoft Corporation',
          imageUrl:
              'https://play-lh.googleusercontent.com/VSvTIWKdsDWqwrGhhdC-pPN3uz0d1VDG9iToVy6vCrVlw1rLtn_zLfy3AKf0ApFdZ8ZeJt0E9ZYFMTi6lK6P=w480-h960-rw',
        ),
        Game(
          id: 'com.notionlabs.notion',
          title: 'Notion',
          description:
              'Workspace all-in-one untuk catatan, database, dan wiki tim.',
          genre: 'Produktivitas',
          rating: 4.3,
          developer: 'Notion Labs, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/vaxxIC1qaXOd1q1hmL7c66N-Mp4LXuQIuBZGM0dPIbwmyWcJAXbhIIZ8hNBWvar54c_j=w240-h480-rw',
        ),
      ],
    ),
    GameCategory(
      id: 'finance',
      title: 'Keuangan & Dompet Digital',
      subtitle: 'Pembayaran, dompet digital, dan perbankan.',
      games: [
        Game(
          id: 'com.gojek.app',
          title: 'GoPay',
          description:
              'Pembayaran transportasi, makanan, dan tagihan dalam ekosistem Gojek.',
          genre: 'Keuangan',
          rating: 4.5,
          developer: 'PT GoTo Gojek Tokopedia',
          imageUrl:
              'https://play-lh.googleusercontent.com/AdojfiKumvRSrBipGmdwyu3I0vbBHzTGba4fvhufJx-t2YBhBKfcLlZyT1X1gvbO2A=s96-rw',
        ),
        Game(
          id: 'ovo.id',
          title: 'OVO',
          description:
              'Dompet digital dengan cashback, poin, dan pembayaran terpadu.',
          genre: 'Keuangan',
          rating: 4.4,
          developer: 'PT Visionet Internasional',
          imageUrl:
              'https://play-lh.googleusercontent.com/-kwEfsDenlwTCoWTe2BCAOv9YFPE4m5EReErdU_BsYYcISAtQ16JflXuwU8Okuw3Y6E=w480-h960-rw',
        ),
        Game(
          id: 'id.dana',
          title: 'DANA',
          description:
              'Bayar tagihan, kirim uang, dan tarik tunai tanpa kartu.',
          genre: 'Keuangan',
          rating: 4.6,
          developer: 'PT Espay Debit Indonesia Koe',
          imageUrl:
              'https://play-lh.googleusercontent.com/pqoyI2JaPd3uOYt-5GzVqi82OvhBC9Jf-EPQqPDhCbyekdKZe5r-hOGlF4qE1ddWe3o=s96-rw',
        ),
      ],
    ),
  ];

  /// Kumpulan semua game dari semua kategori
  static final List<Game> _allGames = _categories
      .expand((category) => category.games)
      .toList(growable: false);

  /// Fetch semua kategori game dengan simulasi delay
  static Future<List<GameCategory>> fetchCategories() async {
    await Future.delayed(_networkDelay);
    return _categories;
  }

  /// Fetch semua game dari semua kategori
  static Future<List<Game>> fetchGames() async {
    await Future.delayed(_networkDelay);
    return _allGames;
  }

  /// Fetch game berdasarkan ID spesifik
  static Future<Game> fetchGameById(String id) async {
    await Future.delayed(_networkDelay);
    return _allGames.firstWhere(
      (game) => game.id == id,
      orElse: () => throw Exception('Game not found'),
    );
  }
}
