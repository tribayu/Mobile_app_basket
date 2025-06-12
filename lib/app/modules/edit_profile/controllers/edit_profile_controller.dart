import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditProfileController extends GetxController {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Ambil data user dari storage
    Map<String, dynamic>? user = box.read('user');

    if (user != null) {
      emailController.text = user['email'] ?? '';
      usernameController.text = user['username'] ?? '';
      passwordController.text = user['password'] ?? '';
    }
  }

  void saveProfile() {
    String email = emailController.text;
    String username = usernameController.text;
    String password = passwordController.text;

    // Simpan data kembali ke storage
    box.write('user', {
      'email': email,
      'username': username,
      'password': password,
    });

    Get.snackbar("Success", "Profile updated successfully",
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
