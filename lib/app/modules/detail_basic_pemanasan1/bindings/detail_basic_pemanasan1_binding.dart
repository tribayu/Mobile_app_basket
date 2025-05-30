import 'package:get/get.dart';

import '../controllers/detail_basic_pemanasan1_controller.dart';

class DetailBasicPemanasan1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailBasicPemanasan1Controller>(
      () => DetailBasicPemanasan1Controller(),
    );
  }
}
