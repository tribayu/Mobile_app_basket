import 'package:get/get.dart';

import '../controllers/latihann_controller.dart';

class LatihannBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihannController>(
      () => LatihannController(),
    );
  }
}
