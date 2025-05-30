import 'package:get/get.dart';

import '../controllers/latihan_basic_kontrol_controller.dart';

class LatihanBasicKontrolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanBasicKontrolController>(
      () => LatihanBasicKontrolController(),
    );
  }
}
