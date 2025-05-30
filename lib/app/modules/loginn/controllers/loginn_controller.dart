import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginnController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final String baseUrl = 'http://192.168.76.102:5000';
  final String apiKey = 'api-key-1234';

  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email dan password wajib diisi');
      return;
    }

    try {
      String basicAuth = 'Basic ' + base64Encode(utf8.encode('$email:$password'));

      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Authorization': basicAuth,
          'x-api-key': apiKey,
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar('Berhasil', 'Login berhasil');
        Get.offAllNamed('/home');
      } else {
        Get.snackbar('Gagal', data['pesan'] ?? 'Login gagal');
      }
    } catch (e) {
      print('ERROR Login: $e');
      Get.snackbar('Error', 'Tidak dapat terhubung ke server');
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
 