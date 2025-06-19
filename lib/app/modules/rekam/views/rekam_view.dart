import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import '../controllers/rekam_controller.dart';

class RekamView extends StatelessWidget {
  const RekamView({super.key});

  @override
  Widget build(BuildContext context) {
    final rekamC = Get.put(RekamController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Pose Detection',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'monospace',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[50],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(() {
        if (!rekamC.cameraReady.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            // Kamera full tinggi secara fleksibel
            Expanded(
              child: rekamC.cameraController.value.isInitialized
                  ? CameraPreview(rekamC.cameraController)
                  : const Center(child: Text("Kamera belum siap")),
            ),

            // Status Deteksi Pose
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                rekamC.predictedLabel.value != "unknown"
                    ? 'Detected: ${rekamC.predictedLabel.value}'
                    : 'Detecting pose...',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Tombol Stop dan Switch Kamera
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: rekamC.stopRecording,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(Icons.stop, color: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: rekamC.switchCamera,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Icon(Icons.sync, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
