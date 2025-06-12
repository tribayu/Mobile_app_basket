import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController extends GetxController {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

 
  final String baseUrl = 'http://192.168.34.102:5000';
  final String apiKey = 'api-key-1234';

  void register() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar('Error', 'Semua field wajib diisi');
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar('Error', 'Password dan konfirmasi tidak cocok');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);

      print('STATUS: ${response.statusCode}');
      print('RESPONSE: ${response.body}');

      if (response.statusCode == 201) {
        Get.snackbar('Berhasil', data['pesan']);
        Get.toNamed('/otp', arguments: {'email': email});
      } else {
        Get.snackbar('Gagal', data['pesan'] ?? 'Registrasi gagal');
      }
    } catch (e) {
      print('ERROR: $e');
      Get.snackbar('Error', 'Tidak dapat terhubung ke server');
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
