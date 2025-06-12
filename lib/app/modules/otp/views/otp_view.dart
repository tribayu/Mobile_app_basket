// lib/modules/otp/otp_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verifikasi OTP"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Masukkan kode OTP yang telah dikirim ke email Anda",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Kode OTP",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.verifyOtp,
              child: controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text("Verifikasi"),
            )),
          ],
        ),
      ),
    );
  }
}
