import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RekamController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;

  var selectedCameraIndex = 0.obs;
  var isRecording = false.obs;
  var cameraReady = false.obs;
  var predictedLabel = "unknown".obs;

  @override
  void onInit() {
    super.onInit();
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    try {
      cameras = await availableCameras();
      cameraController = CameraController(
        cameras[selectedCameraIndex.value],
        ResolutionPreset.medium,
        enableAudio: true,
      );

      await cameraController.initialize();
      await cameraController.prepareForVideoRecording();
      await cameraController.startVideoRecording();

      isRecording.value = true;
      cameraReady.value = true;

      // Simulasi deteksi pose
      Future.delayed(const Duration(seconds: 2), () {
        predictedLabel.value = "pose_detected";
      });
    } catch (e) {
      Get.snackbar("Error", "Gagal mengakses kamera: $e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> stopRecording() async {
    if (!isRecording.value || !cameraController.value.isInitialized) return;

    final file = await cameraController.stopVideoRecording();
    isRecording.value = false;

    Get.snackbar("Rekaman Tersimpan", file.path,
        backgroundColor: Colors.green, colorText: Colors.white);
    Get.back(result: file.path);
  }

  Future<void> switchCamera() async {
    if (cameras.length < 2 || !cameraController.value.isInitialized) return;

    selectedCameraIndex.value =
        (selectedCameraIndex.value + 1) % cameras.length;
    await cameraController.dispose();
    cameraReady.value = false;
    await _setupCamera();
  }

  @override
  void onClose() {
    if (cameraController.value.isInitialized) {
      cameraController.dispose();
    }
    super.onClose();
  }
}
