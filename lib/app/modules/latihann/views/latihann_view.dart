import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihann_controller.dart';

class LatihannView extends GetView<LatihannController> {
  const LatihannView({super.key});

  @override
  Widget build(BuildContext context) {
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

            // Filter Chips - Level
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: ["Basic", "Intermediate"].map((level) {
                      final selected = controller.selectedLevel.value == level;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(level),
                          selected: selected,
                          selectedColor: Colors.blue,
                          labelStyle: TextStyle(
                            color: selected ? Colors.white : Colors.black,
                          ),
                          onSelected: (_) => controller.setLevel(level),
                        ),
                      );
                    }).toList(),
                  ),
                )),

            const SizedBox(height: 10),

            // Filter Chips - Kategori (only for Basic)
            Obx(() {
              if (controller.selectedLevel.value == "Basic") {
                return SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      '',
                      'Pemanasan',
                      'Kontrol & Posisi dasar',
                      'Dribbling',
                      'Passing',
                      'Shooting',
                      'Pendinginan',
                    ].map((cat) {
                      final selected = controller.selectedCategory.value == cat;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Text(cat.isEmpty ? 'Semua' : cat),
                          selected: selected,
                          selectedColor: Colors.blue,
                          labelStyle: TextStyle(
                            color: selected ? Colors.white : Colors.black,
                          ),
                          onSelected: (_) => controller.setCategory(cat),
                        ),
                      );
                    }).toList(),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),

            const SizedBox(height: 10),

            // List Training Card
            Expanded(
              child: Obx(() => ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    itemCount: controller.filteredTrainings.length,
                    itemBuilder: (context, index) {
                      final t = controller.filteredTrainings[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    t['image'],
                                    height: 160,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      t['duration'],
                                      style: const TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t['title'],
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    t['label'],
                                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(height: 8),
                                  LinearProgressIndicator(
                                    value: t['progress'],
                                    backgroundColor: Colors.grey[300],
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {
                                        Get.toNamed(
                                          '/detail-latihan',
                                          arguments: t,
                                        );
                                      },
                                      child: const Text("Mulai"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
