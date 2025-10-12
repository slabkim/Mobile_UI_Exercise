import '../models/game.dart';
import '../models/game_category.dart';

class GameService {
  static const Duration _networkDelay = Duration(milliseconds: 600);

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
        Game(
          id: 'com.facebook.katana',
          title: 'Facebook',
          description:
              'Tetap terhubung dengan teman, komunitas, dan grup favorit Anda.',
          genre: 'Sosial',
          rating: 4.1,
          developer: 'Meta Platforms, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/KCMTYuiTrKom4Vyf0G4foetVOwhKWzNbHWumV73IXexAIy5TTgZipL52WTt8ICL-oIo=w240-h480-rw',
        ),
        Game(
          id: 'com.facebook.orca',
          title: 'Messenger',
          description:
              'Kirim pesan, panggilan, dan video call dengan avatar AR seru.',
          genre: 'Komunikasi',
          rating: 4.3,
          developer: 'Meta Platforms, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/JfQNUnohpuq5IP65WN9C109VjLjDEj2tZYlPtComLznQfGeeoesubOaHGBcpZdXKuHU=w240-h480-rw',
        ),
        Game(
          id: 'com.discord',
          title: 'Discord',
          description:
              'Komunitas suara, teks, dan video untuk gamer dan komunitas hobi.',
          genre: 'Komunikasi',
          rating: 4.5,
          developer: 'Discord Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/0oO5sAneb9lJP6l8c6DH4aj6f85qNpplQVHmPmbbBxAukDnlO7DarDW0b-kEIHa8SQ=w240-h480-rw',
        ),
        Game(
          id: 'com.snapchat.android',
          title: 'Snapchat',
          description:
              'Abadikan momen dengan filter AR dan cerita yang hilang setelah 24 jam.',
          genre: 'Sosial',
          rating: 4.2,
          developer: 'Snap Inc',
          imageUrl:
              'https://play-lh.googleusercontent.com/KxeSAjPTKliCErbivNiXrd6cTwfbqUJcbSRPe_IBVK_YmwckfMRS1VIHz-5cgT09yMo=w240-h480-rw',
        ),
        Game(
          id: 'com.linkedin.android',
          title: 'LinkedIn',
          description:
              'Bangun jaringan profesional dan temukan peluang karier baru.',
          genre: 'Sosial',
          rating: 4.3,
          developer: 'LinkedIn',
          imageUrl:
              'https://play-lh.googleusercontent.com/kMofEFLjobZy_bCuaiDogzBcUT-dz3BBbOrIEjJ-hqOabjK8ieuevGe6wlTD15QzOqw=w240-h480-rw',
        ),
        Game(
          id: 'org.thoughtcrime.securesms',
          title: 'Signal',
          description:
              'Pesan terenkripsi end-to-end dengan fokus privasi dan keamanan.',
          genre: 'Komunikasi',
          rating: 4.5,
          developer: 'Signal Foundation',
          imageUrl:
              'https://play-lh.googleusercontent.com/fYcY22LbFhMCw3cqMFvOWlYYdT1fP-6Sh3GScLB1dGyc1wAoVP9F6z-kUcI8vEUxEqY=w240-h480-rw',
        ),
        Game(
          id: 'jp.naver.line.android',
          title: 'LINE',
          description:
              'Chatting seru dengan stiker lucu, timeline, dan panggilan gratis.',
          genre: 'Komunikasi',
          rating: 4.4,
          developer: 'LINE Corporation',
          imageUrl:
              'https://play-lh.googleusercontent.com/74iMObG1vsR3Kfm82RjERFhf99QFMNIY211oMvN636_gULghbRBMjpVFTjOK36oxCbs=w240-h480-rw',
        ),
        Game(
          id: 'com.tencent.mm',
          title: 'WeChat',
          description:
              'Aplikasi super dengan chat, pembayaran, mini program, dan berita.',
          genre: 'Komunikasi',
          rating: 4.1,
          developer: 'WeChat',
          imageUrl:
              'https://play-lh.googleusercontent.com/qdAU7PJTwjlRQljkXu51lLfSKBVWaXzI0z1YcBAEJqgaVb3l6pTRaG8Dw-3KST-9BnzU=w240-h480-rw',
        ),
        Game(
          id: 'com.twitter.android',
          title: 'X (Twitter)',
          description:
              'Ikuti percakapan global, trending topic, dan pendapat terbaru.',
          genre: 'Sosial',
          rating: 4.0,
          developer: 'X Corp.',
          imageUrl:
              'https://play-lh.googleusercontent.com/ByK2b5f3xWF1vDPf6S6u8uqH1MjzfXFLmhqTsJKVJEZNjqVJJZEiJ6Z4YzcpVwYWzA=w240-h480-rw',
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
        Game(
          id: 'com.disney.disneyplus',
          title: 'Disney+ Hotstar',
          description:
              'Tonton film Disney, Marvel, Star Wars, dan olahraga favorit.',
          genre: 'Streaming',
          rating: 4.3,
          developer: 'Disney',
          imageUrl:
              'https://play-lh.googleusercontent.com/-r7uacR81yPjI76EDR3xP7K3DB_HbZ1bAv2WigmpTixHdBtIr0WpyjUj3L_h-jYBVK7N6DhOiY4Y8GUvaNTE=w240-h480-rw',
        ),
        Game(
          id: 'com.amazon.avod.thirdpartyclient',
          title: 'Prime Video',
          description: 'Film dan serial eksklusif dari Amazon Studios.',
          genre: 'Streaming',
          rating: 4.2,
          developer: 'Amazon Mobile LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/EHqOu-UQqMJxZvZDRnOLJz7NdPhvEXyD2dCH9N_cVOy7jPH8hAQzpQlPo4iamqYihnU=w240-h480-rw',
        ),
        Game(
          id: 'tv.twitch.android.app',
          title: 'Twitch',
          description:
              'Streaming live gaming, esports, dan kreator favorit Anda.',
          genre: 'Streaming',
          rating: 4.5,
          developer: 'Twitch Interactive, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/fM6fHjYmSp7GVqNVBBSNqJwJ9L5Pg8LnbTvHwIpzYq0UF_jVGq7JDgUXkH5C2c-qSi4=w240-h480-rw',
        ),
        Game(
          id: 'com.hbo.hbonow',
          title: 'HBO Max',
          description:
              'Koleksi film blockbuster, HBO Originals, dan konten eksklusif.',
          genre: 'Streaming',
          rating: 4.1,
          developer: 'WarnerMedia Global Digital Services, LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/0R2fnBRqwVH_9CjLWWDjNQYt3X1XQXQZ7_DRSc1w7H-2uVk_SoZBjPpqYxUMjYQc3Q=w240-h480-rw',
        ),
        Game(
          id: 'com.viacom18.voot.tv',
          title: 'Vidio',
          description:
              'Streaming olahraga, sinetron, film lokal, dan channel TV premium.',
          genre: 'Hiburan',
          rating: 4.3,
          developer: 'PT Vidio Dot Com',
          imageUrl:
              'https://play-lh.googleusercontent.com/C2zEOvVT1kLI1jHcvLnpwQ1vFJqYfgBHyR5G2w0YSwm1LpHvZLBc6fEQVbvXX5d0k7A=w240-h480-rw',
        ),
        Game(
          id: 'com.apple.android.music',
          title: 'Apple Music',
          description:
              '60 juta lebih lagu tanpa iklan dan daftar putar eksklusif.',
          genre: 'Musik',
          rating: 4.2,
          developer: 'Apple Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/9m6hKfVnXmRm_vkvAJi0MgkAaOJcV8nZHRpKXKCEo_keLwX3_Ll4ePKHqVaI8-5K5EE=w240-h480-rw',
        ),
        Game(
          id: 'com.bstation.mobile',
          title: 'Bilibili',
          description:
              'Anime, game, dan budaya pop Asia dengan komunitas aktif.',
          genre: 'Hiburan',
          rating: 4.5,
          developer: 'bilibili',
          imageUrl:
              'https://play-lh.googleusercontent.com/IeTfSwcJZ8FPoWzYf7S1bBzDqA0vBD5XdX1MN_rZV5QgDVHH3g7gN0uH7Z4tBMZy4A=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/g0G1bI7pHqcfJMUXRfYpDfRYEr5LCYsKWQxK0VyEAXCvXPvIZ7LJ8u0EczZx3n6EWfM=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/a7lzOQKxiEzCvbXQR-4C-Rv-2wxSL5_gXEpBk8UgMHJ1yZhVhCqFLNFRgRgLOwsNw4c=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/PBIbIwV7bTwSFdEaXCLXhMp_lLh7jEh0Y-HUKvR6gJwYq6pZNRR8xLKQ0gGOLJELWA=w240-h480-rw',
        ),
        Game(
          id: 'com.miHoYo.GenshinImpact',
          title: 'Genshin Impact',
          description:
              'Eksplorasi dunia terbuka dengan cerita epik dan elemen.',
          genre: 'Adventure',
          rating: 4.2,
          developer: 'COGNOSPHERE PTE. LTD.',
          imageUrl:
              'https://play-lh.googleusercontent.com/CmJJGI9Wbse5BYc-Ybmz0qPO9z7eHmqFN8L5gQmFFcv8YH-JlJWsKLrfSqvGZvZkMA=w240-h480-rw',
        ),
        Game(
          id: 'com.activision.callofduty.shooter',
          title: 'Call of Duty Mobile',
          description:
              'Mode multiplayer klasik dan battle royale dengan grafik tinggi.',
          genre: 'Shooter',
          rating: 4.3,
          developer: 'Activision Publishing, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/vl0V-ygOXzqE_5vGzE3JpPE6RzRGLuBFvFbL2TE5KJ3AXwwmzc0JMLaQW9Qr1n7WRQ=w240-h480-rw',
        ),
        Game(
          id: 'com.supercell.clashofclans',
          title: 'Clash of Clans',
          description:
              'Bangun desa, bentuk klan, dan serang pemain lain secara strategis.',
          genre: 'Strategy',
          rating: 4.5,
          developer: 'Supercell',
          imageUrl:
              'https://play-lh.googleusercontent.com/K3ot_rHqJjfvJX6RkEJk9fUeq_LBdJJ8tYvP8LmzlT9u6t8Ov5FKDcCUKZh8bVLCcgw=w240-h480-rw',
        ),
        Game(
          id: 'com.supercell.clashroyale',
          title: 'Clash Royale',
          description:
              'Duel kartu real-time dengan pasukan, spell, dan ikon Clash.',
          genre: 'Strategy',
          rating: 4.4,
          developer: 'Supercell',
          imageUrl:
              'https://play-lh.googleusercontent.com/XZarS_iKAY0p0TLx2Cge2qWsHzqEbmQzQh9AZvgk7pTWwdBR3DgH0pCg0JEjLLqqUg=w240-h480-rw',
        ),
        Game(
          id: 'com.roblox.client',
          title: 'Roblox',
          description:
              'Platform game sosial dengan jutaan pengalaman bikinan komunitas.',
          genre: 'Adventure',
          rating: 4.4,
          developer: 'Roblox Corporation',
          imageUrl:
              'https://play-lh.googleusercontent.com/CDoB_vRrWu3inH4dh0xvUZwhfEEt3MvGXvLdNyPO8LhCzHqZ7L5BPQPhpQy4VvvHyQ=w240-h480-rw',
        ),
        Game(
          id: 'com.innersloth.spacemafia',
          title: 'Among Us',
          description:
              'Kerja sama dan deduksi sosial untuk menemukan impostor.',
          genre: 'Party',
          rating: 4.3,
          developer: 'Innersloth LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/GgPqA7NfbEDpCh-3DsC5K7L1r0h3j0DVTkp4xIGRNEbIJAKnXqTJZAJx5zQcQ9z0w3w=w240-h480-rw',
        ),
        Game(
          id: 'com.king.candycrushsaga',
          title: 'Candy Crush Saga',
          description:
              'Puzzle match-3 legendaris dengan ratusan level dan event rutin.',
          genre: 'Puzzle',
          rating: 4.6,
          developer: 'King',
          imageUrl:
              'https://play-lh.googleusercontent.com/oFdW4O1u6DQ5MfVrJZtJ8gIGXr2vB9T_A2bFwBUdvvULlBjzVbGnLPZY5fDuVyVHdg=w240-h480-rw',
        ),
        Game(
          id: 'com.nianticlabs.pokemongo',
          title: 'Pokémon GO',
          description:
              'Tangkap Pokémon di dunia nyata dengan augmented reality.',
          genre: 'Adventure',
          rating: 4.1,
          developer: 'Niantic, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/5iO3LshI8lRd63Ql7cRJW2cZKvLHNPlFBH8oj7o3UlOVmC8r_H6T4CvYHmK8m36nBow=w240-h480-rw',
        ),
        Game(
          id: 'com.kiloo.subwaysurf',
          title: 'Subway Surfers',
          description:
              'Lari tanpa akhir dengan misi harian dan event kota dunia.',
          genre: 'Arcade',
          rating: 4.5,
          developer: 'SYBO Games',
          imageUrl:
              'https://play-lh.googleusercontent.com/E_w9H0MYP7VXVVS9F_g4FmPOvAKcjHG_gQXfqYP2_sJJVLUqBkYLFk-tVF6g5eaJLHI=w240-h480-rw',
        ),
        Game(
          id: 'com.riotgames.league.wildrift',
          title: 'League of Legends: Wild Rift',
          description:
              'MOBA mobile resmi dengan champion dan gameplay khas LoL PC.',
          genre: 'MOBA',
          rating: 4.3,
          developer: 'Riot Games, Inc',
          imageUrl:
              'https://play-lh.googleusercontent.com/Gvxho8t_xB5g_zKI0SvmqGTN0eX8qIBl6iB2R_kYvYc7eKQQYNH9jkL6Gu3NLBvpFA=w240-h480-rw',
        ),
        Game(
          id: 'com.supercell.brawlstars',
          title: 'Brawl Stars',
          description:
              'Pertarungan 3v3 cepat, mode event, dan brawler unik untuk dikoleksi.',
          genre: 'Action',
          rating: 4.2,
          developer: 'Supercell',
          imageUrl:
              'https://play-lh.googleusercontent.com/dJz5HFE1K_pO1vPE6DVtBdA8S7mBWZLs5b8JSBhNm6Jq-LCk8uBPFVwZ_CxjTnLJTA=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/ZO0L43N3C8EvJzC_QcTZj36vPP0hKhpDMRsLCL5aViC_BXF_6Y7-DG8VPLhCLGfQxQ=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/Q-Qm2WfQgBXD_N-1LjnA7L_8cKdHMIRuDkFnXu-XN8F7j_p1gZxCc-PkH3-_pGCb=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/5L2hOdmwAGJqHnZ3L8qL8eE8dCm5w_xZxR-q3uI5J_5K8rL5m6n7o8p9=w240-h480-rw',
        ),
        Game(
          id: 'com.lazada.android',
          title: 'Lazada',
          description:
              'Marketplace Asia Tenggara dengan live streaming dan promo brand.',
          genre: 'Belanja',
          rating: 4.4,
          developer: 'Lazada Mobile',
          imageUrl:
              'https://play-lh.googleusercontent.com/2yQaVP6HVYFJAJdKjqA_LJh7uQ4ZN0Dj3uB2O5N5N5O5O5P6P6Q7=w240-h480-rw',
        ),
        Game(
          id: 'blibli.mobile.commerce',
          title: 'Blibli',
          description:
              'Belanja kebutuhan harian, gadget, dan tiket resmi terpercaya.',
          genre: 'Belanja',
          rating: 4.6,
          developer: 'PT. Global Digital Niaga',
          imageUrl:
              'https://play-lh.googleusercontent.com/1N2M3L4K5J6I7H8G9F0E1D2C3B4A5Z6Y7X8W9V0U=w240-h480-rw',
        ),
        Game(
          id: 'com.amazon.mShop.android.shopping',
          title: 'Amazon Shopping',
          description:
              'Belanja jutaan produk global dengan dukungan pengiriman internasional.',
          genre: 'Belanja',
          rating: 4.2,
          developer: 'Amazon Mobile LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/lxj_S0oqZH6cAp9S5w3Q2R4T6U7V8W0X1Y2Z3A4B5C6D7=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/Z6eBhXFVnMzO_5K2gCf5N-Qf5Q6P7O8N9M0L1K2J3I4=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/Kd-3xz7Z2Y8X7W6V5U4T3S2R1QoPnM-L-K9J8I7H6G5F4=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/vKZ3X6W5V4U3T2S1RqPoNmLkJiHgFeD-C9B8A7Z6Y5X4=w240-h480-rw',
        ),
        Game(
          id: 'com.atlassian.android.jira.core',
          title: 'Jira Cloud',
          description:
              'Kelola backlog, sprint, dan isu proyek software dengan mudah.',
          genre: 'Produktivitas',
          rating: 4.1,
          developer: 'Atlassian',
          imageUrl:
              'https://play-lh.googleusercontent.com/9w8v7u6t5sRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1=w240-h480-rw',
        ),
        Game(
          id: 'com.slack',
          title: 'Slack',
          description:
              'Kolaborasi tim melalui channel, huddle, dan integrasi aplikasi.',
          genre: 'Produktivitas',
          rating: 4.4,
          developer: 'Slack Technologies Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/Uw5VuTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.trello',
          title: 'Trello',
          description:
              'Papan kanban visual untuk mengelola tugas dan proyek kolaboratif.',
          genre: 'Produktivitas',
          rating: 4.5,
          developer: 'Trello, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/VxWuTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.todoist',
          title: 'Todoist',
          description:
              'Pengelola tugas dengan dukungan label, prioritas, dan reminder.',
          genre: 'Produktivitas',
          rating: 4.6,
          developer: 'Doist Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/WyXuTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.google.android.apps.docs',
          title: 'Google Drive',
          description:
              'Simpan dan kolaborasi dokumen, spreadsheet, dan presentasi.',
          genre: 'Produktivitas',
          rating: 4.4,
          developer: 'Google LLC',
          imageUrl:
              'https://play-lh.googleusercontent.com/XzYuTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.dropbox.android',
          title: 'Dropbox',
          description:
              'Sinkronisasi file lintas perangkat dengan kolaborasi real-time.',
          genre: 'Produktivitas',
          rating: 4.3,
          developer: 'Dropbox, Inc.',
          imageUrl:
              'https://play-lh.googleusercontent.com/AaZuTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.evernote',
          title: 'Evernote',
          description:
              'Kelola catatan, to-do list, dan arsip dokumen dengan mudah.',
          genre: 'Produktivitas',
          rating: 4.2,
          developer: 'Evernote Corporation',
          imageUrl:
              'https://play-lh.googleusercontent.com/BbAvTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.ticktick.task',
          title: 'TickTick',
          description:
              'Manajemen tugas, kalender, dan habit tracker dalam satu aplikasi.',
          genre: 'Produktivitas',
          rating: 4.7,
          developer: 'Appest',
          imageUrl:
              'https://play-lh.googleusercontent.com/CcBwTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/DdCxTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/EeEyTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
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
              'https://play-lh.googleusercontent.com/FfFzTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.telkom.mwallet',
          title: 'LinkAja',
          description:
              'Pembayaran digital untuk transportasi, BUMN, dan merchant offline.',
          genre: 'Keuangan',
          rating: 4.3,
          developer: 'PT Fintek Karya Nusantara',
          imageUrl:
              'https://play-lh.googleusercontent.com/GgGaTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.bca',
          title: 'BCA Mobile',
          description:
              'Aplikasi perbankan BCA dengan klikBCA dan m-BCA dalam satu tempat.',
          genre: 'Keuangan',
          rating: 4.4,
          developer: 'PT Bank Central Asia Tbk.',
          imageUrl:
              'https://play-lh.googleusercontent.com/HhHbTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.bankmandiri.msmile',
          title: 'Livin\' by Mandiri',
          description:
              'Pembukaan rekening digital, QRIS, dan investasi reksa dana.',
          genre: 'Keuangan',
          rating: 4.3,
          developer: 'PT Bank Mandiri (Persero) Tbk.',
          imageUrl:
              'https://play-lh.googleusercontent.com/IiIcTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.btpn.dc',
          title: 'Jenius',
          description:
              'Kelola uang dengan fitur Flexi Saver, Dream Saver, dan Split Bill.',
          genre: 'Keuangan',
          rating: 4.2,
          developer: 'PT Bank BTPN Tbk',
          imageUrl:
              'https://play-lh.googleusercontent.com/JjJdTsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.paypal.android.p2pmobile',
          title: 'PayPal',
          description:
              'Transfer dan terima uang internasional dengan perlindungan pembeli.',
          genre: 'Keuangan',
          rating: 4.4,
          developer: 'PayPal Mobile',
          imageUrl:
              'https://play-lh.googleusercontent.com/KkKeUsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.revolut.revolut',
          title: 'Revolut',
          description:
              'Multi currency wallet, investasi, dan pengelolaan keuangan harian.',
          genre: 'Keuangan',
          rating: 4.5,
          developer: 'Revolut Ltd',
          imageUrl:
              'https://play-lh.googleusercontent.com/LlLfVsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
        Game(
          id: 'com.transferwise.android',
          title: 'Wise',
          description:
              'Transfer internasional murah dengan kurs transparan dan kartu debit.',
          genre: 'Keuangan',
          rating: 4.6,
          developer: 'Wise Payments Ltd',
          imageUrl:
              'https://play-lh.googleusercontent.com/MmMgWsRqPoNmLkJiHgFeD-C9B8A7Z6Y5X4W3V2U1T0S=w240-h480-rw',
        ),
      ],
    ),
  ];

  static final List<Game> _allGames = _categories
      .expand((category) => category.games)
      .toList(growable: false);

  static Future<List<GameCategory>> fetchCategories() async {
    await Future.delayed(_networkDelay);
    return _categories;
  }

  static Future<List<Game>> fetchGames() async {
    await Future.delayed(_networkDelay);
    return _allGames;
  }

  static Future<Game> fetchGameById(String id) async {
    await Future.delayed(_networkDelay);
    return _allGames.firstWhere(
      (game) => game.id == id,
      orElse: () => throw Exception('Game not found'),
    );
  }
}
