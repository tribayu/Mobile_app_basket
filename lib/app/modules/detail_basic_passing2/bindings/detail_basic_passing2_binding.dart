import 'package:get/get.dart';

import '../controllers/detail_basic_passing2_controller.dart';

class DetailBasicPassing2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicPassing2Controller>(
      () => DetailBasicPassing2Controller(),
    );
  }
}
