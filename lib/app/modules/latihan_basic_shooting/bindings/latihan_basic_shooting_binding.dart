import 'package:get/get.dart';

import '../controllers/latihan_basic_shooting_controller.dart';

class LatihanBasicShootingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanBasicShootingController>(
      () => LatihanBasicShootingController(),
    );
  }
}
