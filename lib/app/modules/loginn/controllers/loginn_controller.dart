import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class LoginnController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final String baseUrl = 'http://192.168.34.102:5000';
  final String apiKey = 'api-key-1234';

  final box = GetStorage();

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password wajib diisi');
      return;
    }

    try {
      String basicAuth = 'Basic ${base64Encode(utf8.encode('$email:$password'))}';

      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Authorization': basicAuth,
          'x-api-key': apiKey,
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Simpan history per user
        Map<String, dynamic> allHistory = box.read('history') ?? {};
        List<dynamic> userHistory = List.from(allHistory[email] ?? []);

        userHistory.add({
          'email': email,
          'timestamp': DateTime.now().toIso8601String(),
        });

        allHistory[email] = userHistory;
        box.write('history', allHistory);

        // Simpan user login
        box.write('user', {
          'email': email,
          'username': email.split('@')[0],
          'password': password,
        });

        Get.snackbar('Berhasil', 'Login berhasil');
        Get.offAllNamed('/home');
      } else if (response.statusCode == 202) {
        goToOtp(email);
      } else {
        Get.snackbar('Gagal', data['pesan'] ?? 'Login gagal');
      }
    } catch (e) {
      print('ERROR Login: $e');
      Get.snackbar('Error', 'Tidak dapat terhubung ke server');
    }
  }

  void goToOtp(String email) {
    Get.toNamed('/otp', arguments: {'email': email});
    Get.delete<LoginnController>();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
