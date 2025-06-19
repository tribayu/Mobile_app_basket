import 'package:get/get.dart';

import '../controllers/rekam_controller.dart';

class RekamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RekamController>(
      () => RekamController(),
    );
  }
}
