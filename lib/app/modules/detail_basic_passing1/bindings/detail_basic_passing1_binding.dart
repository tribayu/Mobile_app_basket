import 'package:get/get.dart';

import '../controllers/detail_basic_passing1_controller.dart';

class DetailBasicPassing1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicPassing1Controller>(
      () => DetailBasicPassing1Controller(),
    );
  }
}
