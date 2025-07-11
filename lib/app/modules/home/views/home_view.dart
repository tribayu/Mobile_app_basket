import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controllers/home_controller.dart';
import '../../latihann/views/latihann_view.dart';
import '../../latihann/controllers/latihann_controller.dart';
import '../../profill/views/profill_view.dart';
import '../../artikel/views/artikel_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
            onTap: controller.changeTab,
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
    final homeC = Get.find<HomeController>();

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          _buildTrainingNavigation(),
          const SizedBox(height: 16),
          _buildTrainingProgress(homeC),
          const SizedBox(height: 16),
          _buildCompletedTrainingBars(homeC),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    final box = GetStorage();
    final user = box.read('user') ?? {};
    final username = user['username'] ?? 'User';

    return Container(
      color: const Color(0xFF2771EA),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Selamat Datang,", style: TextStyle(color: Colors.white)),
                Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.notifications_none, color: Colors.white),
          const SizedBox(width: 12),
          const CircleAvatar(backgroundColor: Colors.white, radius: 16),
        ],
      ),
    );
  }

  Widget _buildTrainingNavigation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Kategori Latihan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: _NavigationCard(
                  icon: Icons.fitness_center,
                  label: "Latihan Dasar",
                  onTap: () => Get.toNamed('/latihann', arguments: 'Basic'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _NavigationCard(
                  icon: Icons.trending_up,
                  label: "Latihan Menengah",
                  onTap: () => Get.toNamed('/latihann', arguments: 'Intermediate'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrainingProgress(HomeController homeC) {
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
            child: Obx(() {
              final value = homeC.totalProgress;
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${(value * 100).toInt()}%",
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      const Text("Progress", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedTrainingBars(HomeController homeC) {
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
          children: [
            const Text("Progress Latihan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Obx(() => _ProgressItem(
                  label: "${homeC.basicDone}/6",
                  icon: Icons.fitness_center,
                  progress: homeC.basicDone / 6,
                )),
            const SizedBox(height: 8),
            Obx(() => _ProgressItem(
                  label: "${homeC.intermediateDone}/5",
                  icon: Icons.trending_up,
                  progress: homeC.intermediateDone / 5,
                )),
          ],
        ),
      ),
    );
  }
}

class _NavigationCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _NavigationCard({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.blue, size: 32),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
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
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: progress),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(value: value),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
