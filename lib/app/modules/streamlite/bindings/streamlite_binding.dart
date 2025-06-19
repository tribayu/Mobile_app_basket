import 'package:get/get.dart';

import '../controllers/streamlite_controller.dart';

class StreamliteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StreamliteController>(
      () => StreamliteController(),
    );
  }
}
