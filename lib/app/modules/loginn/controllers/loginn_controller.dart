import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginnController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final box = GetStorage();

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password wajib diisi');
      return;
    }

    try {
      // Simulasi pengecekan akun offline (contoh hardcoded)
      if (email == 'admin@example.com' && password == 'admin123') {
        // Simpan histori login
        List<dynamic> history = box.read<List>('history') ?? [];

        final newEntry = {
          'email': email,
          'timestamp': DateTime.now().toIso8601String(),
        };

        history.add(newEntry);
        box.write('history', history);

        // Simpan user
        box.write('user', {
          'email': email,
          'username': email.split('@')[0],
          'password': password,
        });

        Get.snackbar('Berhasil', 'Login offline berhasil');
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Gagal', 'Email atau password salah');
      }
    } catch (e) {
      print('ERROR Login Offline: $e');
      Get.snackbar('Error', 'Terjadi kesalahan saat login offline');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
