import 'package:get/get.dart';

import '../controllers/loginn_controller.dart';

class LoginnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginnController>(
      () => LoginnController(),
    );
  }
}
