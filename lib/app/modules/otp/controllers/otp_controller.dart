
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  final otpController = TextEditingController();
  final isLoading = false.obs;

  void verifyOtp() async {
    final otp = otpController.text.trim();
    final email = Get.arguments['email'];

    if (otp.isEmpty) {
      Get.snackbar("Error", "OTP tidak boleh kosong");
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse('http://192.168.34.102:5000/verify-otp'), 
        headers: {'Content-Type': 'application/json',
                  'x-api-key': 'api-key-1234',
         },
        body: jsonEncode({'email': email, 'otp': otp}),
      );

      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar("Sukses", "OTP berhasil diverifikasi");
        Get.offNamed('/loginn');
      } else {
        Get.snackbar("Gagal", body['message'] ?? "OTP tidak valid");
      }
    } catch (e) {
      Get.snackbar("Error", "Terjadi kesalahan: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
