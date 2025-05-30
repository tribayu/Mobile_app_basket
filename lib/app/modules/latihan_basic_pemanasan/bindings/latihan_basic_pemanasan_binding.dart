import 'package:get/get.dart';

import '../controllers/latihan_basic_pemanasan_controller.dart';

class LatihanBasicPemanasanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanBasicPemanasanController>(
      () => LatihanBasicPemanasanController(),
    );
  }
}
