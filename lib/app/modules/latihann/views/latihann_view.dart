import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihann_controller.dart';

class LatihannView extends GetView<LatihannController> {
  const LatihannView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    if (args != null && (args == "basic" || args == "intermediate")) {
      controller.setLevel(args.toString());
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextField(
                onChanged: controller.setSearchKeyword,
                decoration: InputDecoration(
                  hintText: 'Search training...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Segmented Tab
            Obx(() {
              final levels = ["Basic", "Intermediate"];
              final selected = controller.selectedLevel.value;
              final index = levels.indexOf(selected);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 300),
                        alignment: index == 0 ? Alignment.centerLeft : Alignment.centerRight,
                        curve: Curves.easeInOut,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      Row(
                        children: levels.map((level) {
                          final isSelected = level == selected;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () => controller.setLevel(level),
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      level == "Basic" ? Icons.fitness_center : Icons.trending_up,
                                      color: isSelected ? Colors.white : Colors.black87,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      level,
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            }),

            const SizedBox(height: 10),

            // Training Cards List
            Expanded(
              child: Obx(() => ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    itemCount: controller.filteredTrainings.length,
                    itemBuilder: (context, index) {
                      final t = controller.filteredTrainings[index];
                      final status = t['status'];
                      final locked = controller.isLocked(t);

                      return GestureDetector(
                        onTap: locked ? null : () => Get.toNamed('/detail-latihan/${t['id']}'),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: locked ? Colors.grey.shade200 : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              if (!locked)
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Gambar
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      t['image'],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      errorBuilder: (_, __, ___) =>
                                          const Icon(Icons.image_not_supported),
                                    ),
                                    if (locked)
                                      Container(
                                        width: 100,
                                        height: 100,
                                        color: Colors.grey.withOpacity(0.6),
                                        child: const Icon(Icons.lock, color: Colors.white),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Informasi
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        t['judul'] ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: locked ? Colors.grey : Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        t['level'] ?? '',
                                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          const Icon(Icons.access_time, size: 14, color: Colors.grey),
                                          const SizedBox(width: 4),
                                          Text(
                                            t['duration'] ?? '',
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Tombol Status
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: status == 'selesai' ? Colors.green.shade100 : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    status == 'selesai' ? 'Selesai' : 'Belum',
                                    style: TextStyle(
                                      color: status == 'selesai' ? Colors.green.shade800 : Colors.black87,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
