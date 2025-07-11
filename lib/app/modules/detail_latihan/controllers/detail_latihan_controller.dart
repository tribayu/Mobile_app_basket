// detail_latihan_controller.dart
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailLatihanController extends GetxController {
  var isLoading = true.obs;
  var latihan = <String, dynamic>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Ambil ID dari parameter URL
    String id = Get.parameters['id'] ?? '1';
    fetchLatihanById(id);
  }

  Future<void> fetchLatihanById(String id) async {
    try {
      isLoading(true);
      final response = await http.get(
        Uri.parse('http://192.168.34.102:3000/latihan/$id'),
      );
      if (response.statusCode == 200) {
        latihan.value = json.decode(response.body);
      } else {
        Get.snackbar("Error", "Data tidak ditemukan");
      }
    } catch (e) {
      Get.snackbar("Error", "Gagal koneksi ke server");
    } finally {
      isLoading(false);
    }
  }
}
