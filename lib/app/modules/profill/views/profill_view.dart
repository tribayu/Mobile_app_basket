import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../streamlite/views/streamlite_view.dart';
import '../controllers/profill_controller.dart';

class ProfillView extends GetView<ProfillController> {
  const ProfillView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final user = box.read('user') ?? {};

    final username = user['username'] ?? 'Guest';
    final email = user['email'] ?? 'unknown@email.com';

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: const [
                  SizedBox(width: 8),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Profile Picture
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
            const SizedBox(height: 12),

            // Name and Email
            Center(
              child: Column(
                children: [
                  Text(
                    username,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    email,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Menu Items
            _buildMenuItem(Icons.edit, "Edit Profile", () {
              Get.toNamed('/edit-profile');
            }),
            _buildMenuItem(Icons.history, "Aktivitas Akun", () {
              Get.toNamed('/history');
            }),
            _buildMenuItem(Icons.web, "Informasi lainnya", () {
              Get.to(() => const StreamliteView());
            }),

            // ✅ Logout dengan popup
            _buildMenuItem(Icons.logout, "Logout", () {
              showDialog(
                context: Get.context!,
                builder: (context) => AlertDialog(
                  title: const Text("Konfirmasi Logout"),
                  content: const Text("Apakah kamu yakin ingin logout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(), // Tutup dialog
                      child: const Text("Batal"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GetStorage().erase(); // Hapus data login
                        Get.offAllNamed('/loginn'); // Kembali ke login
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
