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
          List<dynamic> history = box.read<List>('history') ?? [];

         final newEntry = {
           'email': email,
           'timestamp': DateTime.now().toIso8601String(),
          };

           history.add(newEntry);
           box.write('history', history);

          
           box.write('user', {
            'email': email,
            'username': email.split('@')[0], // default username dari email
            'password': password,
          });
           Get.snackbar('Berhasil', 'Login berhasil');
           Get.offAllNamed('/home');
      } else if (response.statusCode == 202) {
        // Contoh backend mengirim status 202 jika butuh OTP verifikasi
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
    Get.delete<LoginnController>(); // hapus controller agar tidak terjadi penggunaan controller setelah dispose
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
