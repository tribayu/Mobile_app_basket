import 'package:get/get.dart';

import '../controllers/latihan_basic_passing_controller.dart';

class LatihanBasicPassingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanBasicPassingController>(
      () => LatihanBasicPassingController(),
    );
  }
}
