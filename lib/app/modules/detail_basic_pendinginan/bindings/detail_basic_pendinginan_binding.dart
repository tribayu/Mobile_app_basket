import 'package:get/get.dart';

import '../controllers/detail_basic_pendinginan_controller.dart';

class DetailBasicPendinginanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicPendinginanController>(
      () => DetailBasicPendinginanController(),
    );
  }
}
