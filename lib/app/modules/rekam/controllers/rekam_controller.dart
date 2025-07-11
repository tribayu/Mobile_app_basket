import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tflite/tflite.dart';

class RekamController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;

  var selectedCameraIndex = 0.obs;
  var isDetecting = false.obs;
  var cameraReady = false.obs;
  var predictedLabel = "unknown".obs;

  @override
  void onInit() {
    super.onInit();
    _loadModel();
    _setupCamera();
  }

  Future<void> _loadModel() async {
    if (kIsWeb) return;

    try {
      String? res = await Tflite.loadModel(
        model: "assets/basketball_model.tflite",
        labels: "assets/labels.txt",
      );
      debugPrint("Model Loaded: $res");
    } catch (e) {
      debugPrint("Error loading model: $e");
    }
  }

  Future<void> _setupCamera() async {
    try {
      cameras = await availableCameras();

      cameraController = CameraController(
        cameras[selectedCameraIndex.value],
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await cameraController.initialize();
      cameraReady.value = true;
    } catch (e) {
      Get.snackbar("Error", "Gagal mengakses kamera: $e");
    }
  }

  Future<void> startDetection() async {
    if (!cameraController.value.isInitialized || isDetecting.value) return;

    isDetecting.value = true;

    cameraController.startImageStream((CameraImage image) async {
      if (!isDetecting.value) return;

      try {
        var recognitions = await Tflite.runModelOnFrame(
          bytesList: image.planes.map((plane) => plane.bytes).toList(),
          imageHeight: image.height,
          imageWidth: image.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 1,
          threshold: 0.5,
        );

        if (recognitions != null && recognitions.isNotEmpty) {
          predictedLabel.value = recognitions[0]['label'];
        } else {
          predictedLabel.value = "unknown";
        }

        await Future.delayed(const Duration(milliseconds: 500));
      } catch (e) {
        debugPrint("Error during detection: $e");
      }
    });
  }

  Future<void> stopDetection() async {
    if (!isDetecting.value) return;

    try {
      isDetecting.value = false;

      if (cameraController.value.isStreamingImages) {
        await cameraController.stopImageStream();
      }
    } catch (e) {
      debugPrint("Error stopping detection: $e");
    }
  }

  Future<void> switchCamera() async {
    if (cameras.length < 2 || !cameraController.value.isInitialized) return;

    await stopDetection();
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

    if (!kIsWeb) {
      Tflite.close();
    }

    super.onClose();
  }
}
