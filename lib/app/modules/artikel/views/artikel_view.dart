import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../streamlite/views/streamlite_view.dart'; // Pastikan path-nya benar

class ArtikelView extends StatelessWidget {
  const ArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> articles = [
      {
        'kategori': '20Detik',
        'judul': 'Video: Perbasi Hukum Pebasket yang Pukul Lawan di Bogor, Dilarang Main 2 Tahun',
        'tanggal': 'Senin, 24 Feb 2025 07:08 WIB',
        'image': null,
      },
      {
        'kategori': 'detikSport',
        'judul': 'Tim Basket Harlem Globetrotters Beri Coaching Clinic di Jakarta',
        'tanggal': 'Sabtu, 16 Nov 2024 23:20 WIB',
        'image': 'assets/images/jump.jpg',
      },
      {
        'kategori': 'detikSport',
        'judul': 'Pelita Jaya Maroon Cup 2025 Jadi Kompetisi Basket SMA se-Jabodetabek',
        'tanggal': 'Kamis, 30 Jan 2025 22:22 WIB',
        'image': 'assets/images/jump.jpg',
      },
      {
        'kategori': 'detikEdu',
        'judul': 'Mengetahui Sejarah Bola Basket di Dunia, Siapa Penciptanya?',
        'tanggal': 'Rabu, 11 Des 2024 09:30 WIB',
        'image': 'assets/images/jump.jpg',
      },
      {
        'kategori': '',
        'judul': '5 Gaya Couple Kylie Jenner dan Timothee Chalamet Kencan di Pertandingan Basket',
        'tanggal': '22 jam yang lalu',
        'image': 'assets/images/jump.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Artikel Basket'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: articles.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final artikel = articles[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Konten text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (artikel['kategori'] != '')
                            Text(
                              artikel['kategori'],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          const SizedBox(height: 4),
                          Text(
                            artikel['judul'],
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            artikel['tanggal'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Gambar (jika ada)
                    if (artikel['image'] != null) ...[
                      const SizedBox(width: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          artikel['image'],
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),

          // Tombol Navigasi ke StreamliteView
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.web),
                label: const Text(' Streamlite'),
                onPressed: () {
                  Get.to(() => const StreamliteView());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
