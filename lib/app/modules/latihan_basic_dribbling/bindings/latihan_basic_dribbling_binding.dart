import 'package:get/get.dart';

import '../controllers/latihan_basic_dribbling_controller.dart';

class LatihanBasicDribblingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanBasicDribblingController>(
      () => LatihanBasicDribblingController(),
    );
  }
}
