import 'package:get/get.dart';

import '../controllers/intermediate_controller.dart';

class IntermediateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntermediateController>(
      () => IntermediateController(),
    );
  }
}
