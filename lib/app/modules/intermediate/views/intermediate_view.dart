import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/intermediate_controller.dart';

class IntermediateView extends GetView<IntermediateController> {
  const IntermediateView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> trainingList = [
      {
        'title': 'Combo Dribble',
        'duration': '8 mins • Intermediate',
        'image': 'assets/images/combo.jpg',
      },
      {
        'title': 'Cone Attack Dribble',
        'duration': '6 mins • Intermediate',
        'image': 'assets/images/cone.jpg',
      },
      {
        'title': 'Wall Passing Repetition',
        'duration': '7 mins • Intermediate',
        'image': 'assets/images/wall.jpg',
      },
      {
        'title': 'Form Shooting Drill',
        'duration': '6 mins • Intermediate',
        'image': 'assets/images/formshot.jpg',
      },
      {
        'title': 'Shadow Defense Slide',
        'duration': '8 mins • Intermediate',
        'image': 'assets/images/shadow.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Intermediate Training'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: 'Search training...',
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Filter button
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text("Intermediate"),
            ),
          ),
          const SizedBox(height: 16),
          // List
          ...trainingList.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(item['image']!, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text(item['duration']!, style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text("Mulai"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
