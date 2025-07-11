import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailArtikelView extends StatelessWidget {
  const DetailArtikelView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> artikel = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Artikel'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                artikel['image'] ?? 'assets/images/jump.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // Judul
            Text(
              artikel['judul'] ?? 'Judul tidak tersedia',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Tanggal
            Text(
              artikel['tanggal'] ?? 'Tanggal tidak diketahui',
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 16),

            // Isi Artikel
            Text(
              artikel['isi'] ?? 'Konten artikel belum tersedia.',
              style: const TextStyle(fontSize: 16, height: 1.6),
            ),

            const SizedBox(height: 24),

            // Link ke sumber
            if (artikel['sumber'] != null)
              GestureDetector(
                onTap: () async {
                  final url = Uri.parse(artikel['sumber']);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: const Text(
                  'Informasi lebih lengkap di sini',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
