import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_latihan_controller.dart';

class DetailLatihanView extends GetView<DetailLatihanController> {
  const DetailLatihanView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? {};
    return Scaffold(
      appBar: AppBar(
        title: Text(data['title'] ?? 'Detail Latihan'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Gambar Latihan
            if (data['image'] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  data['image'],
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),

            // Detail
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['title'] ?? '',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 18, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(data['duration'] ?? '', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(data['description'] ?? 'Belum ada deskripsi.'),
                  const SizedBox(height: 16),
                  const Text(
                    'Tujuan Latihan:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(data['goals'] ?? 'Belum ada tujuan.'),
                ],
              ),
            ),

            const Spacer(),

            // Tombol Tunda & Selesai (atas)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Get.snackbar('Ditunda', 'Latihan ditunda',
                            backgroundColor: Colors.grey[300], colorText: Colors.black87);
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Tunda', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.snackbar('Selesai', 'Latihan berhasil diselesaikan',
                            backgroundColor: Colors.green, colorText: Colors.white);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Selesai', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Tombol Mulai Latihan dengan Kamera (bawah)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  // Kamera belum diaktifkan
                  onPressed: () {
                    Get.snackbar(
                      'Fitur Belum Aktif',
                      'Fitur latihan dengan kamera belum tersedia.',
                      backgroundColor: Colors.orange,
                      colorText: Colors.white,
                    );
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Mulai Latihan dengan Kamera'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
