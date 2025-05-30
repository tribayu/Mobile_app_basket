import 'package:get/get.dart';

import '../controllers/latihan_basic_pendinginan_controller.dart';

class LatihanBasicPendinginanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanBasicPendinginanController>(
      () => LatihanBasicPendinginanController(),
    );
  }
}
