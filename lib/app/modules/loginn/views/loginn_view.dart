import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/loginn_controller.dart';

class LoginnView extends GetView<LoginnController> {
  const LoginnView({super.key});

  @override
  Widget build(BuildContext context) {
    final rememberMe = false.obs;

    return Scaffold(
      backgroundColor: const Color(0xFFE9F5F3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header lengkung atas
            Container(
              height: 220,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(33, 150, 243, 1), // hijau tua
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat Datang 👋',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Masuk untuk melanjutkan latihanmu',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  // Email
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: const Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Password
                  TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Remember me dan Lupa Password
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            value: rememberMe.value,
                            onChanged: (val) => rememberMe.value = val!,
                          )),
                      const Text("Remember me"),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // aksi lupa password
                        },
                        child: const Text(
                          "Lupa kata sandi?",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Tombol Login
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => controller.login(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Navigasi ke Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Belum punya akun?"),
                      TextButton(
                        onPressed: () => Get.toNamed('/register'),
                        child: const Text(
                          "Daftar sekarang",
                          style: TextStyle(
                            color: Color.fromRGBO(33, 150, 243, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
