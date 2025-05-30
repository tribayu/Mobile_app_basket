import 'package:get/get.dart';

import '../controllers/detail_latihan_controller.dart';

class DetailLatihanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailLatihanController>(
      () => DetailLatihanController(),
    );
  }
}
