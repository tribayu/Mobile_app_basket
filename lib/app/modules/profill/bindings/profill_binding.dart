import 'package:get/get.dart';

import '../controllers/profill_controller.dart';

class ProfillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfillController>(
      () => ProfillController(),
    );
  }
}
