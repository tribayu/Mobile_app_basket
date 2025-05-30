import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihan_basic_pemanasan_controller.dart';

class LatihanBasicPemanasanView extends GetView<LatihanBasicPemanasanController> {
  const LatihanBasicPemanasanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic & Intermediate toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLevelButton("Basic", true),
                const SizedBox(width: 12),
                _buildLevelButton("Intermediate", false),
              ],
            ),
            const SizedBox(height: 16),

            // Navigasi tombol ke jenis latihan
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildNavButton("Pemanasan", "/latihan-basic-pemanasan"),
                _buildNavButton("Dribbling", "/latihan-basic-dribbling"),
                _buildNavButton("Kontrol", "/latihan-basic-kontrol"),
                _buildNavButton("Shooting", "/latihan-basic-shooting"),
                _buildNavButton("Passing", "/latihan-basic-passing"),
                _buildNavButton("Pendinginan", "/latihan-basic-pendinginan"),
              ],
            ),

            const SizedBox(height: 24),

            // Card latihan
            _buildCard(
              title: "Jumping Jack",
              subtitle: "5 mins • Basic",
              progress: 0.3,
            ),
            const SizedBox(height: 16),
            _buildCard(
              title: "Dynamic Stretching",
              subtitle: "4 mins • Basic",
              progress: 0.5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelButton(String label, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildNavButton(String label, String route) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required String subtitle, required double progress}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: progress),
        ],
      ),
    );
  }
}
