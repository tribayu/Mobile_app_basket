import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profill_controller.dart';

class ProfillView extends GetView<ProfillController> {
  const ProfillView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  
                  const SizedBox(width: 8),
                  const Text(
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
            Center(
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profill.jpg'),
              ),
            ),
            const SizedBox(height: 12),

            // Name and Email
            const Text(
              "Michael",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "michael@email.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),

            // Menu Items
            _buildMenuItem(Icons.edit, "Edit Profile", () {
              Get.toNamed('/edit-profile');
            }),
            _buildMenuItem(Icons.history, "History", () {
               Get.toNamed('/history');
            }),
            _buildMenuItem(Icons.settings, "Setting", () {
              // Navigasi ke setting
            }),
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
