import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rekam_controller.dart';
import 'package:camera/camera.dart';

class RekamView extends StatelessWidget {
  const RekamView({super.key});

  @override
  Widget build(BuildContext context) {
    final rekamC = Get.put(RekamController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Pose Detection'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.black,
      ),
      body: Obx(() {
        if (!rekamC.cameraReady.value || !rekamC.cameraController.value.isInitialized) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Expanded(
              child: CameraPreview(rekamC.cameraController),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                rekamC.predictedLabel.value != "unknown"
                    ? 'Detected: ${rekamC.predictedLabel.value}'
                    : 'Detecting...',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() => ElevatedButton.icon(
                        onPressed: rekamC.isDetecting.value
                            ? rekamC.stopDetection
                            : rekamC.startDetection,
                        icon: Icon(rekamC.isDetecting.value
                            ? Icons.stop
                            : Icons.play_arrow),
                        label: Text(rekamC.isDetecting.value
                            ? "Stop"
                            : "Start Detection"),
                      )),
                  ElevatedButton.icon(
                    onPressed: rekamC.switchCamera,
                    icon: const Icon(Icons.flip_camera_android),
                    label: const Text("Switch"),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
