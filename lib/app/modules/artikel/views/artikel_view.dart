import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../streamlite/views/streamlite_view.dart';

class ArtikelView extends StatelessWidget {
  const ArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> articles = [
      {
        'kategori': 'AP News',
        'judul': 'Kevin Durant pindah ke Houston Rockets dalam trade besar',
        'tanggal': '21 Juni 2025',
        'image': 'assets/images/jump.jpg',
        'isi': 'Kevin Durant resmi pindah ke Houston Rockets dalam salah satu trade paling mengejutkan musim ini. Langkah ini diharapkan dapat memperkuat skuad muda Rockets untuk bersaing di wilayah barat NBA.',
        'sumber': 'https://apnews.com/article/0f70dd6296c4093cf6b4f27800ba99cd',
      },
      {
        'kategori': 'WSJ',
        'judul': 'LA Lakers terjual seharga \$10 Miliar, rekor tertinggi dalam sejarah olahraga',
        'tanggal': '19 Juni 2025',
        'image': 'assets/images/jump.jpg',
        'isi': 'LA Lakers memecahkan rekor dunia setelah franchise tersebut dibeli oleh investor baru dengan nilai \$10 miliar, menjadikannya akuisisi olahraga termahal sepanjang sejarah.',
        'sumber': 'https://www.wsj.com/sports/basketball/lakers-sold-mark-walter-dodgers-buss-9c70bcc8',
      },
      {
        'kategori': 'Kompas',
        'judul': 'Bhayangkara wakili Indonesia di World Police & Fire Games 2025',
        'tanggal': '20 Juni 2025',
        'image': 'assets/images/jump.jpg',
        'isi': 'Tim basket Bhayangkara akan mewakili Indonesia dalam ajang World Police & Fire Games 2025 yang diadakan di Kanada. Persiapan intensif tengah dilakukan untuk membawa nama baik bangsa.',
        'sumber': 'https://www.kompas.com',
      },
      {
        'kategori': 'Wikipedia',
        'judul': 'Liga basket wanita 3×3 “Unrivaled” resmi bergulir di AS',
        'tanggal': '15 Juni 2025',
        'image': 'assets/images/jump.jpg',
        'isi': 'Liga basket wanita 3x3 yang dinamai "Unrivaled" secara resmi dimulai di Amerika Serikat dengan konsep yang menarik dan pemain profesional dari berbagai tim.',
        'sumber': 'https://en.wikipedia.org/wiki/Unrivaled_(basketball_league)',
      },
      {
        'kategori': 'The New Yorker',
        'judul': 'Caitlin Clark, bintang baru WNBA, ubah wajah basket wanita',
        'tanggal': '10 Juni 2025',
        'image': 'assets/images/jump.jpg',
        'isi': 'Caitlin Clark terus mencuri perhatian dengan performa luar biasa di WNBA. Kehadirannya membawa gelombang baru untuk popularitas basket wanita di AS dan dunia.',
        'sumber': 'https://www.newyorker.com/sports/sporting-scene/the-caitlin-clark-rules',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Artikel Basket'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final a = articles[index];
                return GestureDetector(
                  onTap: () => Get.toNamed('/detail-artikel', arguments: a),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.asset(
                            a['image'] ?? 'assets/images/default.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  a['kategori'],
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  a['judul'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  a['tanggal'],
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
