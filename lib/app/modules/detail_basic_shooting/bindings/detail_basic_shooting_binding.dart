import 'package:get/get.dart';

import '../controllers/detail_basic_shooting_controller.dart';

class DetailBasicShootingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicShootingController>(
      () => DetailBasicShootingController(),
    );
  }
}
