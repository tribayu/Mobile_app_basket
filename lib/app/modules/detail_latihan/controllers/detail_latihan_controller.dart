import 'package:get/get.dart';

class DetailLatihanController extends GetxController {
  late Map<String, dynamic> latihan;

  @override
  void onInit() {
    super.onInit();
    latihan = Get.arguments as Map<String, dynamic>;
  }
}
