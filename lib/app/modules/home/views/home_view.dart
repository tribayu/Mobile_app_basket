import 'package:basketball/app/modules/artikel/views/artikel_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../latihann/views/latihann_view.dart';
import '../../profill/views/profill_view.dart';
import '../../latihann/controllers/latihann_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LatihannController()); 

    final pages = [
      const _HomePage(),
      const LatihannView(),
      const ArtikelView(),
      const ProfillView(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() => pages[controller.currentIndex.value]),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.currentIndex.value = index;
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: "Latihan"),
              BottomNavigationBarItem(icon: Icon(Icons.article), label: "Artikel"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
            ],
          )),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildRecommendedTraining(),
          const SizedBox(height: 16),
          _buildTrainingProgress(),
          const SizedBox(height: 16),
          _buildCompletedTrainingBars(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color(0xFF2771EA),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Selamat Datang,", style: TextStyle(color: Colors.white)),
                Text(
                  "Byq",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          const Icon(Icons.notifications_none, color: Colors.white),
          const SizedBox(width: 12),
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedTraining() {
    final latihanController = Get.find<LatihannController>();
    final List<Map<String, dynamic>> basicPreview = latihanController.basicLatihan;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Recommended Training", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Persiapan Fisik & Pemanasan", style: TextStyle(color: Colors.black54)),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 190,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: basicPreview.length > 4 ? 4 : basicPreview.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) {
              final data = basicPreview[i];

              return GestureDetector(
                onTap: () {
                  Get.toNamed('/detail-latihan', arguments: data);
                },
                child: Container(
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          data['image'] ?? '',
                          height: 90,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          data['title'] ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "${data['duration'] ?? ''}   ${data['category'] ?? ''}",
                          style: const TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: LinearProgressIndicator(value: data['progress'] ?? 0.0),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrainingProgress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text("Training Progress", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        value: 0.0,
                        strokeWidth: 10,
                        backgroundColor: Colors.grey.shade300,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("0%", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("Complete", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    _StatusBox(icon: Icons.check_circle, label: 'Completed', value: '0'),
                    _StatusBox(icon: Icons.timelapse, label: 'Pending', value: '0'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedTrainingBars() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Completed Trainings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 16),
            _ProgressItem(label: "Basics", icon: Icons.menu_book, progress: 0.0),
            SizedBox(height: 8),
            _ProgressItem(label: "Intermediate", icon: Icons.school, progress: 0.0),
          ],
        ),
      ),
    );
  }
}

class _StatusBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatusBox({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final double progress;

  const _ProgressItem({required this.label, required this.icon, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              LinearProgressIndicator(value: progress),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Text("${(progress * 100).toInt()}%", style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
